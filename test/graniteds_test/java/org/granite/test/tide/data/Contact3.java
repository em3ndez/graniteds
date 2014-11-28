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

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.GenericGenerator;


/**
 * @author Franck WOLFF
 */
@Entity
public class Contact3 implements Serializable {

	private static final long serialVersionUID = 1L;


    public Contact3() {
    }
    
    public Contact3(BigDecimal id) {
    	this.id = id;
    }
    
    private BigDecimal id;
    
    private Person3 person;


    @Id
	@GenericGenerator( name = "generator", strategy = "increment" )
	@GeneratedValue( generator = "generator" )
	public BigDecimal getId() {
        return id;
    }
    public void setId(BigDecimal id) {
        this.id = id;
    }
    
    @ManyToOne(optional=false)
    public Person3 getPerson() {
        return person;
    }
    public void setPerson(Person3 person) {
        this.person = person;
    }
}
