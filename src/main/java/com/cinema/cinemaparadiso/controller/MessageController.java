package com.cinema.cinemaparadiso.controller;

import com.cinema.cinemaparadiso.model.Message;
import com.cinema.cinemaparadiso.model.Post;
import com.cinema.cinemaparadiso.service.MessageService;
import com.cinema.cinemaparadiso.service.UserService;

import java.time.Instant;
import java.time.LocalDate;
import java.util.Date;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/messages")
@Slf4j
public class MessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    @GetMapping("/listSend")
    public String listSend(Model model){
		String username = ((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        Iterable<Message> messages = messageService.findByEmisorUsername(username);
        model.addAttribute("messages", messages);
        model.addAttribute("tipo", "send");
        log.info("Listing Messages..."+messages.toString());
        return "messages/listMessage";
    }

    @GetMapping("/listReceived")
    public String listReceived(Model model){
		String username = ((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
        Iterable<Message> messages = messageService.findByReceptorUsername(username);
        model.addAttribute("messages", messages);
        model.addAttribute("tipo", "received");
        log.info("Listing Messages..."+messages.toString());
        return "messages/listMessage";
    }

    @GetMapping("/show/{messageId}")
    public String show(Model model, @PathVariable("messageId") Integer messageId){
    	try {
	        Message message = messageService.findById(messageId);
	        model.addAttribute("message", message);
	        log.info("Showing Message..."+message.toString());
    	}catch (NoSuchElementException e) {
	        log.error("Error Showing Message..."+messageId.toString());
		}
        return "messages/showMessage";
    }

    @GetMapping("/create/{userName}")
    public String initFormCreateMessage(Model model, @PathVariable("userName") String userName){
    	try {
    		Message message = new Message();
            model.addAttribute("message", message);
            model.addAttribute("userName", userName);
    		model.addAttribute("Estado", "Exito");
    	}catch (IllegalArgumentException e) {
    		model.addAttribute("Estado", "Error al iniciar la entidad");
		}
        log.info("Initializing Messages to..."+userName.toString());
        return "messages/createMessageForm";
    }

    @PostMapping("/create/{userName}")
    public String create(Model model, @PathVariable("userName") String userName, @Validated @ModelAttribute("message") Message message){
    	try {
    		String emisor_username = SecurityContextHolder.getContext().getAuthentication().getName();
    		message.setEmisor(userService.getUserByUsername(emisor_username));
    		message.setReceptor(userService.getUserByUsername(userName));
    		message.setMessageDate(Date.from(Instant.now()));
    		messageService.create(message);
    		model.addAttribute("Estado", "Exito");
    	}catch (IllegalArgumentException e) {
    		model.addAttribute("Estado", "Error, entidad incorrecta");
    		model.addAttribute(message);
		}
        log.info("Creating Messages..."+message.toString());
        return "redirect:/messages/listReceived";
    }

    @GetMapping("/delete/{messageId}")
    public String initDelete(Model model, @PathVariable("messageId") Integer messageId){

    	try {
    		Message message = messageService.findById(messageId);
    		String username = ((User)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername();
    		if(message.getEmisor().getUsername()!=username && message.getReceptor().getUsername()!=username) {
    			model.addAttribute("Error", "No tienes relacion con esta entidad");
    			return "/error";
    		}
    		messageService.delete(message);
    		model.addAttribute("Estado", "Exito");
            log.info("Deleting Messages..."+message.toString());
    	}catch (NoSuchElementException e) {
    		model.addAttribute("Estado", "Error, identificador incorrecto");
            log.error("Error Deleting Message..."+messageId);
		}
        return "redirect:/messages/listReceived";
    }
}