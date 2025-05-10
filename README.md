# Atlys-Assignment
iOS  - Take home assignment - Atlys

This project replicates an image carousel with smooth scrolling and zooming features using SwiftUI. The carousel behaves like a typical image carousel where users can swipe through images, and the currently visible image is zoomed in. The project implements the carousel view with the following key features:

1. **Smooth Scrolling**: The carousel moves smoothly when the user scrolls, without erratic behavior.
2. **Pagination**: When the user stops scrolling, the carousel automatically centers on the nearest tile.
3. **Zooming Effect**: The image in the middle zooms in as it comes to the center.
4. **No Third-Party Libraries**: Only built-in SwiftUI components are used.
5. **Adaptive Layout**: The carousel's height adapts based on the content, ensuring it resizes automatically when views are added above or below.

---

### Features

- **Scrollable Carousel**: You can interact with the carousel by panning around the images.
- **Zoom Effect**: Images zoom in when they are at the center of the carousel.
- **Auto Page Control**: The carousel uses a page control to indicate the current image.
- **Resizable**: The carousel view adjusts its height dynamically based on the surrounding views.

---

## 🔧 Add-ons & Notes

- **MVVM Architecture**: The project follows the MVVM (Model-View-ViewModel) architecture to ensure separation of concerns and maintainability.
- **API-Ready Design**: While this demo uses a local JSON file to simulate image data, the codebase is structured to support fetching images from an API. You can easily integrate a network layer to dynamically load and update carousel images.
- **Easy Extension**: Adding or removing images is simple—just update the JSON or the API response, and the carousel will automatically reflect the changes.

---

### Demo

You can view a demo of the carousel in action below. 
Note: The height is not actually 250 points; this is just for demonstration purposes.

<div style="display: inline-block; margin-right: 10px;">
    <img src="Atlys/Resources/demowithoutScrolling250.gif" width="300" height="600" />
</div>
<div style="display: inline-block;">
    <img src="Atlys/Resources/demoResizingWithout250.gif" width="300" height="600" />
</div>

