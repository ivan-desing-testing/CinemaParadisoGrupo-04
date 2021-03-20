package com.cinema.cinemaparadiso.model;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="artists")
@Getter
@Setter
public class Artist extends Person {
	
	@ElementCollection(targetClass=Role.class)
	@Column(name="roles")
	private List<Role> roles;
	/*
	@Column(name="projects")
	@ManyToMany(mappedBy = "team")
	private List<Project> projects;
	*/
}