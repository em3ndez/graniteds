/**
 * Generated by Gas3 v1.1.0 (Granite Data Services) on Sat Jul 26 17:58:20 CEST 2008.
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERRIDDEN EACH TIME YOU USE
 * THE GENERATOR. CHANGE INSTEAD THE INHERITED CLASS (Person.as).
 */

package org.granite.test.tide.data {

    import flash.utils.ByteArray;
    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    
    import mx.collections.ArrayCollection;
    import mx.collections.ListCollectionView;
    
    import org.granite.meta;
    import org.granite.test.tide.AbstractEntity;
    import org.granite.tide.IEntityManager;
    import org.granite.tide.IPropertyHolder;
    import org.granite.util.Enum;

    use namespace meta;

    [Managed]
    [RemoteClass(alias="org.granite.test.tide.Comment")]
    public class Comment extends AbstractEntity {

		private var _commentList:CommentList;
		private var _name:String;
        
        		
		public function set name(value:String):void {
			_name = value;
		}
		public function get name():String {
			return _name;
		}
		
		public function set commentList(value:CommentList):void {
			_commentList = value;
		}
		public function get commentList():CommentList {
			return _commentList;
		}
		

        override meta function merge(em:IEntityManager, obj:*):void {
            var src:Comment = Comment(obj);
            super.meta::merge(em, obj);
            if (meta::isInitialized()) {
				em.meta_mergeExternal(src._commentList, _commentList, null, this, 'commentList', function setter(o:*):void{_commentList = o as CommentList}) as CommentList;
				em.meta_mergeExternal(src._name, _name, null, this, 'name', function setter(o:*):void{_name = o as String}) as String;
            }
        }

        override public function readExternal(input:IDataInput):void {
            super.readExternal(input);
            if (meta::isInitialized()) {
				_commentList = input.readObject() as CommentList;
				_name = input.readObject() as String;
            }
        }

        override public function writeExternal(output:IDataOutput):void {
            super.writeExternal(output);
            if (meta::isInitialized()) {
				output.writeObject((_commentList is IPropertyHolder) ? IPropertyHolder(_commentList).object : _commentList);
				output.writeObject((_name is IPropertyHolder) ? IPropertyHolder(_name).object : _name);
            }
        }
    }
}
