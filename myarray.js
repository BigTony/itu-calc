 // myarray.js
var activeObj = 0;
var objArray = new Array();
var lineArray = new Array();


function getObj(x) {
     return objArray[x]
 }
function addObj(item) {
     objArray.push(item)
 }
function insertObj(item,x) {
     objArray.splice(x,0,item)
 }


function getLine(x) {
     return lineArray[x]
 }
function addLine(item) {
     lineArray.push(item)
 }
function resize(obj){
    if (obj.resizable===true){
    obj.width=obj.childrenRect.width
    }

    if (obj.parent.resizable===true){
    resize(obj.parent)
    }

}
