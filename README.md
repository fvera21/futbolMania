# FutbolManía

## Qué hace el proyecto
  Este proyecto es una aplicación web diseñada para gestionar órdenes de compra y generar facturas para implementos de fútbol. Los usuarios pueden ingresar productos, crear órdenes de compra y obtener facturas detalladas de sus transacciones.

## Justificación del proyecto
  La creación de esta plataforma web responde a la necesidad de un sistema eficiente para gestionar las ordenes de compra y facturación de implementos de fútbol. Proporcionando una herramienta que automatiza la creación de facturas, reduciendo errores y mejorando la eficiencia administrativa.

## Instalación
### 1. Descarga este repositorio en tu ordenador

- **Acción**: Clona el repositorio desde GitHub a tu ordenador.
- **Cómo hacerlo**: 
  - Abre tu navegador web y navega a la página del repositorio en GitHub.
  - Haz clic en el botón "Code" y copia la URL del repositorio.
  - Abre una terminal (Command Prompt en Windows, Terminal en macOS o Linux).
  - Usa el comando `git clone [URL_del_repositorio]` para clonar el repositorio en tu ordenador. Reemplaza `[URL_del_repositorio]` con la URL que copiaste.
  
  ```bash
  git clone https://github.com/usuario/nombre-del-repositorio.git
  ```

### 2. Abrir el repositorio en Visual Studio Code

- **Acción**: Abre la carpeta del repositorio clonado en Visual Studio Code.
- **Cómo hacerlo**: 
  - Abre Visual Studio Code.
  - Haz clic en "File" > "Open Folder" y navega hasta la carpeta donde clonaste el repositorio.
  - Selecciona la carpeta y haz clic en "Open".

### 3. Instala las dependencias necesarias con pip

- **Acción**: Instalar todas las dependencias del proyecto.
- **Cómo hacerlo**: 
  - Abre la terminal integrada en Visual Studio Code (View > Terminal).
  - Asegúrate de que tu entorno virtual de Python esté activado si estás usando uno.
  - Ejecuta el siguiente comando para instalar las dependencias desde el archivo `requirements.txt`:
  
  ```bash
  pip install -r requirements.txt
  ```

### 4. Abrir XAMPP y hacer clic en "Start" en APACHE y MYSQL

- **Acción**: Iniciar los servicios de Apache y MySQL en XAMPP.
- **Cómo hacerlo**: 
  - Abre XAMPP desde el menú de inicio de tu ordenador.
  - En el panel de control de XAMPP, encuentra los módulos de "Apache" y "MySQL".
  - Haz clic en el botón "Start" junto a ambos módulos para iniciarlos.

### 5. En XAMPP, hacer clic en el botón "ADMIN" de MySQL

- **Acción**: Abrir phpMyAdmin.
- **Cómo hacerlo**: 
  - En el panel de control de XAMPP, haz clic en el botón "Admin" junto a "MySQL".
  - Esto abrirá una nueva pestaña en tu navegador con phpMyAdmin.

### 6. En phpMyAdmin, importar la base de datos

- **Acción**: Importar la base de datos del proyecto.
- **Cómo hacerlo**: 
  - En la interfaz de phpMyAdmin, selecciona la opción "Importar" en la parte superior.
  - Haz clic en "Seleccionar archivo" y navega hasta la carpeta del proyecto para encontrar el archivo `futbolmania.sql`.
  - Selecciona el archivo y haz clic en "Continuar" para importar la base de datos.

### 7. Ejecutar el servidor local

- **Acción**: Iniciar el servidor de desarrollo de Django.
- **Cómo hacerlo**: 
  - Vuelve a la terminal integrada en Visual Studio Code.
  - Asegúrate de estar en el directorio principal del proyecto (donde se encuentra `manage.py`).
  - Ejecuta el siguiente comando para iniciar el servidor de desarrollo:

  ```bash
  python manage.py runserver
  ```

### 8. Abrir la aplicación en tu navegador

- **Acción**: Acceder a la aplicación web.
- **Cómo hacerlo**: 
  - Después de ejecutar el servidor, aparecerá un enlace en la consola que generalmente es `http://127.0.0.1:8000/`.
  - Haz clic en el enlace o cópialo y pégalo en tu navegador para abrir la aplicación.
