/**
 * Generated by Gas3 v1.1.0 (Granite Data Services) on Sat Jul 26 17:58:20 CEST 2008.
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERRIDDEN EACH TIME YOU USE
 * THE GENERATOR. CHANGE INSTEAD THE INHERITED CLASS (Contact.as).
 */

package org.granite.test.tide.framework {

	[Name("myComponentLocal")]
	[Bindable]
    public class MyComponentLocalGDS471 {
    	
       	[In]
		public var application:Object;

		[In(create="false", global="true")]
        public var globalOutjectedVariable:String;
        
        public var value:String;

        [Observer("step1Conv")]
		public function initializeConversationScopedController():void {
			value = globalOutjectedVariable;
		}
    }
}