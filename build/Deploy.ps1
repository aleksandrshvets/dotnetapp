@"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: alex-app-deployment
  labels:
    app: alex-app
spec:
  selector:
    matchLabels:
      app: alex-app
  template:
    metadata:
      labels:
        app: alex-app
    spec:
      imagePullSecrets:
      - name: regcred
      containers:
      - name: alexcontainerapp
        image: alexhomeacr.azurecr.io/alexcontainerapp:v1
        imagePullPolicy: Always
        ports:
        - name: http
          containerPort: 8080
          protocol: TCP
        resources:
          limits:
            cpu: 2000m
            memory: 512Mi
          requests:
            cpu: 100m
            memory: 64Mi
"@ | kubectl apply -f -