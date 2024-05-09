# FROM node:18-alpine AS BUILD_IMAGE
# WORKDIR /home/app

# COPY package.json .

# RUN npm install

# COPY . .

# RUN npm run build


# ## The Second build stage
# FROM node:18-alpine AS PROD_BUILD

# WORKDIR /home/app


# COPY --from=BUILD_IMAGE /home/app/build/ /home/app/build/

# COPY package.json .

# COPY .env .

# RUN npm install -g serve 


# CMD ["serve", "-s", "build"]



FROM node:alpine
RUN mkdir -p /home/backend
COPY . /home/backend
WORKDIR /home/backend
RUN npm run build
RUN npm install -g serve 
# EXPOSE 4343
CMD ["serve", "-s", "build"]