package org.granite.test.jmf.model;

import org.granite.messaging.annotations.PropertiesOrder;

@PropertiesOrder({"d", "b", "c", "a", "e"})
@SuppressWarnings("unused")
public class PropertiesOrderBean {

	private String a;
	private String b;
	private String c;
	private String d;
	private String e;
	
	public PropertiesOrderBean() {
	}
}
