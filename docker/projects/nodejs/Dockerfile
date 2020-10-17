FROM node:alpine

WORKDIR /usr/app

# copy the the package just to download the depenencies
COPY ./package.json ./

# download depenencies
RUN npm install

# copy the rest of the files. 
# docker will execute everything that changed. If index is changed, docker will detect that './' changed a will download everything again
# Since 99% of the time the package.json is not changed, the previous step will not run everytime a file changes
COPY ./ ./

CMD ["npm","start"]
