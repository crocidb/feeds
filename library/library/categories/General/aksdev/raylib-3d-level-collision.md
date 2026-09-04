+++
title = "Raylib 3D level collision"
description = "I just wanted to quickly recap how I got collisions working in Raylib with firstperson camera and the level itself. It took me some time to realise how to get it work but with the help of Raylib discord, I managed to do it!Just a note: Since this collision m"
date = "2021-06-04T00:00:00Z"
url = "https://akselmo.dev/posts/raylib-3d-level-collision/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.163560624Z"
seen = true
+++

I just wanted to quickly recap how I got collisions working in Raylib with firstperson camera and the level itself. It took me some time to realise how to get it work but with the help of [Raylib](https://raylib.com) discord, I managed to do it!

Just a note: Since this collision method uses bounding boxes, this will only work if your level consists of multiple meshes: Every mesh should ideally be one building block. For example, if you want to make a tunnel, you should make it from four meshes, instead of one with a hole inside it.

First I made a level generator that makes a level out of series of cubes. Sure, it's not the most performance efficient since it draws textures even when player can't see them, but it'll do for now.

The level building blocks, models, are inside an array of structs that contain block model and position. You can then draw them easily to their correct positions.

To get collisions work with these blocks, you'll have to create a function that takes players position and size to account, then compares it to each walls bounding box, which is created from position and size.

Here's the function I use:

```

bool CheckLevelCollision(Vector3 entityPos, Vector3 entitySize)
{
    LevelData* levelData = GetLevelData();

    BoundingBox entityBox = (BoundingBox){(Vector3){ entityPos.x - entitySize.x/2,
                                                     entityPos.y - entitySize.y/2,
                                                     entityPos.z - entitySize.z/2 },
                                          (Vector3){ entityPos.x + entitySize.x/2,
                                                     entityPos.y + entitySize.y/2,
                                                     entityPos.z + entitySize.z/2 }};

    for (int i=0; i < levelBlockAmount; i++)
    {
        Vector3 wallPos = levelData[i].levelBlockPosition;
        Vector3 wallSize = {1.0f,1.0f,1.0f};
        BoundingBox levelBox = (BoundingBox){(Vector3){ wallPos.x - wallSize.x/2,
                                                        wallPos.y - wallSize.y/2,
                                                        wallPos.z - wallSize.z/2 },
                                             (Vector3){ wallPos.x + wallSize.x/2,
                                                        wallPos.y + wallSize.y/2,
                                                        wallPos.z + wallSize.z/2 }};

        DrawBoundingBox(levelBox,GREEN);

        if (CheckCollisionBoxes(entityBox,levelBox))
        {
            return true;
        }
    }
    return false;
}

```

It's probably not the most efficient, but it works! I basically followed the example here: [https://www.raylib.com/examples/web/models/loader.html?name=models\_box\_collisions](https://www.raylib.com/examples/web/models/loader.html?name=models_box_collisions)

[About raycasts](#about-raycasts)
----------

When comparing mesh and raycast, make sure you use proper Transform matrix! This was something I struggled for long time, but luckily I got Raylib discord to help me.

Here's how I got my player weapon raycasting collide with the level:

```
float TestLevelHit(Ray rayCast)
{
    float distance = INFINITY;
    LevelData* levelData = GetLevelData();
    //Make sure the level size is all the cubes
    for (int i=0; i < GetLevelBlockAmount(); i++)
    {

        Vector3 pos = levelData[i].levelBlockPosition;
        RayHitInfo hitLevel = GetCollisionRayMesh(rayCast,levelData[i].levelBlockModel.meshes[0],MatrixTranslate(pos.x,pos.y,pos.z));
        if (hitLevel.hit)
        {
            if (hitLevel.distance < distance)
            {
                distance = hitLevel.distance;
                id = levelData[i].modelId;
            }
        }

    }
    return distance;
}

```

**You can find the full code of my Raylib FPS here: [https://github.com/Akselmo/Artificial-Rage](https://github.com/Akselmo/Artificial-Rage)**

I hope these code snippets will be useful to someone who is battling with same problems!