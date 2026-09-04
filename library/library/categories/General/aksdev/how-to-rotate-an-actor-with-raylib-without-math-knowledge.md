+++
title = "How to rotate an actor with Raylib without math knowledge"
description = "Rotate what now? Aks, what are you talking about?I wanted to write down how I made the enemy characters in Artificial Rage rotate towards the player, since I couldn't find a simple answer.Most things I found was math. Now math is "
date = "2022-11-22T00:00:00Z"
url = "https://akselmo.dev/posts/how-to-rotate-an-actor-with-raylib/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.102693415Z"
seen = true
+++

*Rotate what now? Aks, what are you talking about?*

I wanted to write down how I made the enemy characters in [Artificial Rage](https://codeberg.org/akselmo/artificial-rage) rotate towards the player, since I couldn't find a simple answer.

Most things I found was math. Now math is fun and good, but when you're tired and want to get one thing just to *work* at 4 am, it's not gonna help you.

Especially since I've never learned linear algebra at any school I've went to (or I just likely don't remember), and double especially since all the math lingo is in English and I have *no idea what any of it means!!!*

Getting Gooder at math is on my eternal to-do list, but anyhow, for those like me who just need to get something done, here's how I did it.

First off, I just wanted the character to rotate around it's Y-axis: If you would stick a.. well stick in a grape and twirl the stick in your fingers, that's the Y-axis of the grape. This means the following snippet does not take account the other axises. But I'm sure it could be used for it.

Code dump incoming:

```
// C99 code
void Actor_RotateTowards(Actor_Data* actor, Vector3 targetPosition)
{
    // Rotates the actor around Y axis
    Vector3 diff        = Vector3Subtract(actor->position, targetPosition);
    float y_angle       = -(atan2(diff.z, diff.x) + PI / 2.0);
    Vector3 newRotation = (Vector3) { 0, y_angle, 0 };

    // Use quaternion slerping for smoother rotation, so the actor always follows the shortest path
    Quaternion start = QuaternionFromEuler(actor->rotation.z, actor->rotation.y, actor->rotation.x);
    Quaternion end   = QuaternionFromEuler(newRotation.z, newRotation.y, newRotation.x);
    Quaternion slerp = QuaternionSlerp(start, end, actor->rotationSpeed * GetFrameTime());

    actor->model.transform = QuaternionToMatrix(slerp);
    actor->rotation        = newRotation;
}

```

I'll quickly walk you through the code:

1. First you need the position of the target, so the actor knows where to rotate towards.
2. Get the difference between actors position and targets position
3. Measure the [counterclockwise angle for the X- and Z-axis of the difference of the actor and target position](https://en.wikipedia.org/wiki/Atan2), then rub some PI on it. Divide this with two because my friend [CapitalEx](https://furry.engineer/@CapitalEx) said so. Something about radians/euler angles. Math. Comment if you can explain this like you would for a 5 year old. hlep
4. Your new rotation is now ready, just use the y\_angle you got for the, well, Y-axis.
5. Uhhhhh quaternions. Create Quaternion for start position that is the current rotation of the actor, end position that is the target rotation so the thing you just got. We use quaternions so the computer uses shortest rotation path possible.
6. [Slerrrrrrrp](https://en.wikipedia.org/wiki/Slerp) the rotation from start to end with your wanted speed. Don't forget to apply frame deltatime or the higher the fps, the faster the spins.
7. Give the new cool slerped quaternion you just got as a matrix to the model's transform. Don't forget to update the rotation to the new one.
8. Done! Nice.

I wish I understood this better. I've tried to learn quaternions with this fun website: [https://eater.net/quaternions](https://eater.net/quaternions). It works for a while, but then I forget it.

Anyhow, that's the gist of it. Now the 3d models rotate around their Y-axis towards anything you would ever want. Nice!

Feel free to explain math in the comments to me. Again, math words in English are difficult for me, but if explained simple enough I think I would understand it. Also if you have videos you can recommend me about the topic, do share!

That's all for this time, thanks for reading!