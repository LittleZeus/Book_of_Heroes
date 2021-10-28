
//Follow parent
x = parent.x - offsetX;
y = parent.y - offsetY;

//Countdown lifetime
if (maxLifetime != -1)
{
	++lifetime;
	if (lifetime >= maxLifetime) instance_destroy();
	if (lifetime >= (maxLifetime/image_number)*(image_index+1))
	{
		image_index++;
	}
}

//Check hitbox
calAttack(hitbox);