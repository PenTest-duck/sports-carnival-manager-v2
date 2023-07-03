FROM mhart/alpine-node:12

# install dependencies
WORKDIR /
COPY package.json package-lock.json ./
RUN npm ci

# Copy all local files into the image.
COPY . .

RUN npm run build

###
# Only copy over the Node pieces we need
# ~> Saves 35MB
###
FROM mhart/alpine-node:slim-12

WORKDIR /
COPY --from=0 / .
COPY . .

EXPOSE 3000
CMD ["node", "./build"]