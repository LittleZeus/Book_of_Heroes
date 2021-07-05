//Check if obj is member of our faction
if (other.faction == faction) exit;
else if(1==0){ // Invincible then kill other
	take_damage(other, 1);
}

if (contact_attack == true) {
	take_damage(self, 1);
	knockback(other.x,other.y,self,50);
}