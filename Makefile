scss ?= static/scss/main.scss
css ?= static/css/main.css

all: styles

staging:
	cd deploy/ && fab deploy && cd ..

production:
	cd deploy/ && fab deploy --set environment=production && cd ..

run:
	python pulse.py

styles:
	sass $(scss):$(css)

watch:
	sass --watch $(scss):$(css)

clean:
	rm -f $(css)

# downloads latest snapshot of data locally
data_init:
	aws s3 sync s3://pulse.cio.gov/live/scan/ data/output/scan/results/
	aws s3 sync s3://pulse.cio.gov/live/processed/ data/output/processed/
