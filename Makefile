release:
	@if [ "${TAG}" = "" ]; then \
		echo "[ERROR] Must pass the TAG argument!!" ; \
		echo ">>> Usage:" ; \
		echo "	make release TAG=v1.2.3" ; \
		exit 1; \
	fi
	aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/r4f1b2w1
	docker build -t my-app:${TAG} .
	docker tag my-app:${TAG} public.ecr.aws/r4f1b2w1/my-app:${TAG}
	docker push public.ecr.aws/r4f1b2w1/my-app:${TAG}