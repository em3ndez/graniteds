<%--
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

  @author Franck WOLFF
--%><%
    Set as3Imports = new TreeSet();

	as3Imports.add("flash.utils.flash_proxy");
    if (!jClass.hasSuperclass()) {
        as3Imports.add("org.granite.tide.Component");
        as3Imports.add("org.granite.tide.BaseContext");
    }
    as3Imports.add("org.granite.tide.ITideResponder");
	as3Imports.add("mx.rpc.AsyncToken");
	

    for (jImport in jClass.imports) {
        if (jImport.as3Type.hasPackage() && jImport.as3Type.packageName != jClass.as3Type.packageName)
            as3Imports.add(jImport.as3Type.qualifiedName);
    }

%>/**
 * Generated by Gas3 v${gVersion} (Granite Data Services).
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERWRITTEN EACH TIME YOU USE
 * THE GENERATOR. INSTEAD, EDIT THE INHERITED CLASS (${jClass.as3Type.name}.as).
 */

package ${jClass.as3Type.packageName} {
<%
	///////////////////////////////////////////////////////////////////////////////
	// Write Import Statements.

    for (as3Import in as3Imports) {%>
    import ${as3Import};<%
    }%>
    
    use namespace flash_proxy;<%

	///////////////////////////////////////////////////////////////////////////////
	// Write Class Declaration.%>

    public class ${jClass.as3Type.name}Base<%

        if (jClass.hasSuperclass()) {
            %> extends ${jClass.superclass.as3Type.name}<%
        } else {
            %> extends Component<%
        }%> {

        public function ${jClass.as3Type.name}Base() {
            super();
        }
<%
	///////////////////////////////////////////////////////////////////////////
	// Write Public Getter/Setter.

    for (jProperty in jClass.properties) {
        if (jProperty.readable || jProperty.writable) {%>
<%
            if (jProperty.writable) {%>
        public <%= jProperty.writeOverride ? "override " : "" %>function set ${jProperty.name}(value:${jProperty.as3Type.name}):void {
            super.meta_internalSetProperty("${jProperty.name}", value, true, false);
        }<%
            }
            if (!jProperty.writable) {%>
        [Bindable(event="propertyChange")]<%
            } else {%>
        [Bindable]<%
            }%>
        public <%= jProperty.readOverride ? "override " : "" %>function get ${jProperty.name}():${jProperty.as3Type.name} {
            return super.getProperty("${jProperty.name}") as ${jProperty.as3Type.name};
        }<%
        }
    }        
        
	///////////////////////////////////////////////////////////////////////////
	// Write Methods.
        
    for (jMethod in jClass.methods) {%>    
        <%
        if (jMethod.options != null) {%>
        [${jMethod.options}]<%
        }
        int idx = 0;
        for (opt in jMethod.getAs3ParameterOptions()) {
            if (opt != null) {%>
        [${opt}("${jMethod.getAs3ParameterNames()[idx]}")]<%
            }
            idx++; 
        }%>
        public function ${jMethod.name}(<%
            String[] names = jMethod.getAs3ParameterNames();

            int count = 0;
            for (pType in jMethod.getAs3ParameterTypes()) {
                if (count > 0) {
                    %>, <%
                }
                %>${names[count]}:${pType.name}<%
                count++;
            }
            if (count > 0) {%>, <% }%>resultHandler:Object = null, faultHandler:Function = null):AsyncToken {
            if (faultHandler != null)
                return callProperty("${jMethod.name}"<%

            count = 0; 
            for (pType in jMethod.getAs3ParameterTypes()) {
                %>, ${names[count]}<%
                count++;
            }%>, resultHandler, faultHandler) as AsyncToken;
            else if (resultHandler is Function || resultHandler is ITideResponder)
                return callProperty("${jMethod.name}"<% 

            count = 0;
            for (pType in jMethod.getAs3ParameterTypes()) {
                %>, ${names[count]}<%
                count++;
            }%>, resultHandler) as AsyncToken;
            else if (resultHandler == null)
                return callProperty("${jMethod.name}"<% 

            count = 0;
            for (pType in jMethod.getAs3ParameterTypes()) {
                %>, ${names[count]}<%
                count++;
            }%>) as AsyncToken;
            else
                throw new Error("Illegal argument to remote call (last argument should be Function or ITideResponder): " + resultHandler);
        }<%        
    }%>
    }
}
