# Blueprint: Aplicación de Pastelería

## Visión General

Esta es una aplicación Flutter para una pastelería, diseñada para mostrar productos de una manera visualmente atractiva y moderna. La aplicación contará con un diseño limpio, navegación intuitiva y un estilo que evoca la calidez de una pastelería artesanal.

## Características Implementadas

### Versión Inicial

*   **Pantalla Principal (GridView)**:
    *   **Diseño**: Una pantalla de `GridView` con 2 columnas y 7 filas para mostrar 14 productos.
    *   **Tarjetas de Producto**: Cada producto se muestra en una `Card` con:
        *   Imagen del producto desde una URL.
        *   Nombre del producto.
        *   Calificación con estrellas y puntuación numérica.
        *   Sombra suave y bordes redondeados para un aspecto "lifted".
    *   **Barra de Aplicación (AppBar)**: Título "GridView Demo – Mi Pastelería" y un icono de corazón.
    *   **Estilo**: Tema de colores pastel suaves para que coincida con la identidad de la pastelería.

## Plan Actual

1.  **Reemplazar el contenido de `lib/main.dart`**: Actualizar el archivo principal para implementar la pantalla de la galería de productos.
2.  **Definir la estructura de datos**: Crear una clase `Product` para almacenar la información de cada artículo (imagen, nombre, calificación, puntuación).
3.  **Implementar la Interfaz de Usuario (UI)**:
    *   Construir la `AppBar` personalizada con el título y un icono.
    *   Desarrollar el `GridView` usando `GridView.builder` con una `SliverGridDelegateWithFixedCrossAxisCount` de 2 columnas.
    *   Diseñar la `Card` del producto, incluyendo `Image.network`, el texto del nombre y una fila para la calificación por estrellas.
    *   Crear una función auxiliar para generar dinámicamente los iconos de estrellas basados en la puntuación.
4.  **Integrar los datos**: Poblar el `GridView` con la lista de 14 productos y sus imágenes correspondientes.
