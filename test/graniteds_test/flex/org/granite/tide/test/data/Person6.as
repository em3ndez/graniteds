/**
 * Generated by Gas3 v1.1.0 (Granite Data Services) on Sat Jul 26 17:58:20 CEST 2008.
 *
 * WARNING: DO NOT CHANGE THIS FILE. IT MAY BE OVERRIDDEN EACH TIME YOU USE
 * THE GENERATOR. CHANGE INSTEAD THE INHERITED CLASS (Person.as).
 */

package org.granite.tide.test.data {

    import flash.utils.IDataInput;
    import flash.utils.IDataOutput;
    
    import mx.collections.ListCollectionView;
    
    import org.granite.meta;
    import org.granite.ns.tide;
    import org.granite.tide.IEntityManager;
    import org.granite.tide.IPropertyHolder;
    import org.granite.tide.test.AbstractEntity;
    import org.granite.util.Enum;

    use namespace meta;
    use namespace tide;

    [Managed]
    [RemoteClass(alias="org.granite.tide.test.Person6")]
    public class Person6 extends AbstractEntity {

		private var _salutation:Salutation;
        private var _salutations:ListCollectionView;
        
        
        public function set salutation(value:Salutation):void {
        	_salutation = value;
        }
        public function get salutation():Salutation {
        	return _salutation;
        }
        
        public function set salutations(value:ListCollectionView):void {
            _salutations = value;
        }
        public function get salutations():ListCollectionView {
            return _salutations;
        }

        override meta function merge(em:IEntityManager, obj:*):void {
            var src:Person6 = Person6(obj);
            super.meta::merge(em, obj);
            if (meta::isInitialized()) {
                em.meta_mergeExternal(src._salutation, _salutation, null, this, 'salutation', function setter(o:*):void{_salutation = o as Salutation}) as Salutation;
				em.meta_mergeExternal(src._salutations, _salutations, null, this, 'salutations', function setter(o:*):void{_salutations = o as ListCollectionView}) as ListCollectionView;
            }
        }

        override public function readExternal(input:IDataInput):void {
            super.readExternal(input);
            if (meta::isInitialized()) {
                _salutation = Enum.readEnum(input) as Salutation;
				_salutations = input.readObject() as ListCollectionView;
            }
        }

        override public function writeExternal(output:IDataOutput):void {
            super.writeExternal(output);
            if (meta::isInitialized()) {
                output.writeObject((_salutation is IPropertyHolder) ? IPropertyHolder(_salutation).object : _salutation);
				output.writeObject((_salutations is IPropertyHolder) ? IPropertyHolder(_salutations).object : _salutations);
            }
        }
    }
}