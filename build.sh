IMAGE_NAME="$1"

if test -z "$IMAGE_NAME"
then
  IMAGE_NAME="enbock/node-azure-cli:latest"
fi

if uname -a | grep x86_64 > /dev/null
then
  echo "Build image $IMAGE_NAME..."
  docker build -t "$IMAGE_NAME" .
  docker push -t "$IMAGE_NAME"
else
  INSTANCE="$(docker buildx create --use)"
  echo "Build image $IMAGE_NAME with buildx $INSTANCE..."
  docker buildx build --platform linux/amd64 --push -t "$IMAGE_NAME" .
  docker buildx rm "$INSTANCE"
fi
