# Bart Runner - Wollok Game

Un videojuego de plataformas tipo "Endless Runner" desarrollado en **Wollok** para la materia *Paradigmas de Programación* en la **UTN FRBA**. El proyecto se centra en la aplicación de conceptos de Programación Orientada a Objetos (POO) como polimorfismo, herencia y encapsulamiento.

## Características Técnicas

* **Motor de Física Personalizado:** Implementación manual de gravedad y salto mediante vectores de posición en el loop del juego (`game.onTick`).
* **Sistema de Colisiones (Hitboxes):** Lógica de intersección de rectángulos (`Pair` x/y) para detectar colisiones precisas entre el personaje y entidades dinámicas.
* [cite_start]**Generación Procedural (Spawner):** Instanciación aleatoria de obstáculos y power-ups basada en probabilidad, utilizando polimorfismo para tratar a todas las entidades bajo una interfaz común pero con comportamientos distintos.
* **Gestión de Estados:** Manejo de vida, "Game Over" y puntuación mediante objetos dedicados.

## Tecnologías

* **Lenguaje:** Wollok (Language for learning Object-Oriented Programming).
* **Librería:** Wollok Game.
* **Conceptos:** Polimorfismo, Herencia, Colecciones, WKO (Well Known Objects).

## Estructura del Proyecto

* `/src`: Código fuente.
    * [cite_start]`bart.wlk`: Lógica del personaje, gravedad y movimiento[cite: 626].
    * [cite_start]`obstaculos.wlk`: Clases de enemigos y power-ups (Herencia)[cite: 614].
    * [cite_start]`spawner.wlk`: Lógica de generación de entidades[cite: 621].
    * [cite_start]`mainRunner.wpgm`: Punto de entrada y configuración del juego[cite: 619].
* `/assets`: Imágenes y recursos gráficos.
