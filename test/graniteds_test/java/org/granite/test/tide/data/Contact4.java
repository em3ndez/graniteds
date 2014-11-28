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

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;


/**
 * @author Franck WOLFF
 */
@Entity
public class Contact4 extends AbstractEntity {

    private static final long serialVersionUID = 1L;


    public Contact4() {
    }
    
    public Contact4(Long id, Long version, String uid) {
    	super(id, version, uid);
    }
    
    @ManyToOne(optional=false)
    private Person4 person;

    @Basic
    private String email;


    public Person4 getPerson() {
        return person;
    }
    public void setPerson(Person4 person) {
        this.person = person;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
}
