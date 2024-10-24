# Aquí se usa la imagen que debe ser oficial de Node.js que será version 14
#esto sera base para nuestro contenedor, junto con esta imagen se incluye
#de igual forma Node.js y npm, lo que debería de facilitar la instalación
#de dependencias y la ejecución de nuestra aplicación(nes) Node.js
FROM node:14

# Esto es para establecer un directorio de trabajo que estará dentro del
# contenedor mismo donde estará nuestra apliación, lo que hace que los
#comandos como copy y run se puedan ejecutar en el directorio correcto
WORKDIR /usr/src/app

# se copian los archivos que sean .json, no se especifican por lo que se pone *
#para que sean todos los .json, estos archivos contienen las dependencias de node
# que necesitamos instalar
COPY package*.json ./

# es mas que nada para que se ejecute este comando dentro de lcontenedor y se instalen todad
#las dependecias que se listen o estén en el archivo .json
RUN npm install

# Hace que se copie todo el código de nuestra aplicación del directorio actusl
#al del contenddor
COPY . .

# Se abre o expone el puerto 8080  especificando que nuestra aplicación usará ese puerto
#para que se pueda cominicar con el exterior o sea visible para otras personas, en pocas palabras:
    #para que podamos acceder desde afuera del contenedor
EXPOSE 8080

# estos son mas que nada comandos que se ejecutarán cuando el contenedor se inicie
CMD ["node", "server.js"]
