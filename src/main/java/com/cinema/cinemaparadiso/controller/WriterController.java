package com.cinema.cinemaparadiso.controller;

import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.cinemaparadiso.model.Writer;
import com.cinema.cinemaparadiso.model.Skill;
import com.cinema.cinemaparadiso.model.User;
import com.cinema.cinemaparadiso.model.Writer;
import com.cinema.cinemaparadiso.service.WriterService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/writers")
@Slf4j
public class WriterController {

	@Autowired
	private WriterService writerService;

	@GetMapping("/list")
	public String list(Model model) {
		Iterable<Writer> writers = writerService.list();
		model.addAttribute("writers", writers);
		log.info("Listing Writers..." + writers.toString());
		return "writers/listWriter";
	}
	
	@GetMapping(value = { "/show/{writerId}" })
	public String showWriter(@PathVariable("writerId") int writerId, Model model) {
		Writer writer = writerService.findWriterById(writerId);
		model.addAttribute("writerId", writerId);
		model.addAttribute("writer", writer);
		return "writers/showWriter";
	}
	@GetMapping("/create")
    public String initFormCreateWriter(Model model) {
		User user = new User();
        Writer writer = new Writer();
        List<Skill> skill = Arrays.asList(Skill.values());
        model.addAttribute("writer", writer);
        model.addAttribute("user",user);
        model.addAttribute("isNew", true);
        model.addAttribute("skill", skill);
        return "/writers/createOrUpdateWriterForm";

    }

    @PostMapping("/create")
    public String createWriter(Model model, @ModelAttribute("writer") @Valid Writer writer,
              BindingResult result) {
  
    	List<Skill> skill = Arrays.asList(Skill.values());
    	model.addAttribute("skill", skill);
          log.info("================================"+ writer.getName());
          if(!result.hasErrors()) {
        	 
              writerService.createWriter(writer);
          }else {
              return "writers/createOrUpdateWriterForm";
          }
          return "index";
      }
}