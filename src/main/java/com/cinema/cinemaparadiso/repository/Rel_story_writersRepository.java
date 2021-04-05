package com.cinema.cinemaparadiso.repository;

import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.cinema.cinemaparadiso.model.Rel_story_writers;



	public interface Rel_story_writersRepository extends CrudRepository<Rel_story_writers,Integer>{
	
	@Query("SELECT rel_story_writers FROM Rel_story_writers rel_story_writers WHERE (rel_story_writers.writer_id = ?1 and rel_story_writers.story_id = ?2)")
	public Rel_story_writers findRelacion(Integer writerId, Integer storytId) throws DataAccessException;

}