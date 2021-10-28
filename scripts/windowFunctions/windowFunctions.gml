// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function windowVisible(_child,_visible){
	_child.visible = _visible;
	if (_child.parent != -1) _child.parent.visible = _visible;
	if (_child.child != -1) _child.child.visible = _visible;
}