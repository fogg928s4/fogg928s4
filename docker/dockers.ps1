docker exec $CONTAINER_ID -it bash
docker-compose up -d
docker-compose down -v
docker logs $CONTAINER_NAME