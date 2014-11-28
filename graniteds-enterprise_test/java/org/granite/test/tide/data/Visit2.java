/*
  GRANITE DATA SERVICES
  Copyright (C) 2011 GRANITE DATA SERVICES S.A.S.

  This file is part of Granite Data Services.

  Granite Data Services is free software; you can redistribute it and/or modify
  it under the terms of the GNU Library General Public License as published by
  the Free Software Foundation; either version 2 of the License, or (at your
  option) any later version.

  Granite Data Services is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public License
  for more details.

  You should have received a copy of the GNU Library General Public License
  along with this library; if not, see <http://www.gnu.org/licenses/>.
*/

package org.granite.test.tide.data;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 * @author Franck WOLFF
 */
@Entity
public class Visit2 extends AbstractEntity {

    private static final long serialVersionUID = 1L;


    public Visit2() {
    }
    
    public Visit2(Long id, Long version, String uid) {
    	super(id, version, uid);
    	tests = new HashSet<Test2>();
    }
    
    @Basic
    private String name;

	@Fetch(FetchMode.JOIN)
	@ManyToOne(optional = false)
	@JoinColumn(name = "patient_id", nullable = false)
	private Patient2 patient;

	@OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<Test2> tests = new HashSet<Test2>();


	public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public Patient2 getPatient() {
    	return patient;
    }
    public void setPatient(Patient2 patient) {
    	this.patient = patient;
    }

    public Set<Test2> getTests() {
        return tests;
    }
    public void setTests(Set<Test2> tests) {
        this.tests = tests;
    }
}
