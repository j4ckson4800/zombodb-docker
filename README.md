### ZomboDB Dockerfile

If you don't want to install Rust or download half the world wide web onto your OS.
If you just need to ship this thing to docker and don't want to pay $100.00 just to have rust binaries compiled for you.

Then you can start with this thing.
I created this Dockerfile just to play around with ZomboDB and see if I even need it in my project.

I don't recommend using this particular file in production, at least because I used 777 permissions for the /zombodb directory.
But you can still use it, as in my situation, or as a starting point.

Don't forget to add the extension using `CREATE EXTENSION zombodb;`.