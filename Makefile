pub: clean
	./mkhtml.sh
	cp html/* ../txt/

rls: clean
	./mkrls.sh

clean:
	rm -rf html
