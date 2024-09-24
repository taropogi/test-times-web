function Buffer() {
	this.buffer = new Array(100);
}

Buffer.prototype.append = function append(string) { 
   this.buffer.push(string); 
   return this; 
 }; 

Buffer.prototype.toString = function toString() { 
   return this.buffer.join(""); 
 };
 
Buffer.prototype.app = Buffer.append;