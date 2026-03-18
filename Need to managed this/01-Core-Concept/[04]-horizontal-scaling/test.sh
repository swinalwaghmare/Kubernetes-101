for j in {1..10}; do
    for i in {1..1000}; do
        curl -s -o /dev/null -w "%{http_code}\n" http://a977bc815e79d40ffaf74b5016f4bfb9-1696623251.us-east-1.elb.amazonaws.com/ &
    done
    wait # Wait for all background curl processes to finish before next iteration
done