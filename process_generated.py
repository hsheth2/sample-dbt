import json


def process_catalog(catalog):
    return catalog


def process_manifest(manifest):
    return manifest


def process_sources(sources):
    return sources


if __name__ == "__main__":

    with open("./target/catalog.json", "r") as file:
        catalog = json.load(file)

    with open("./target/manifest.json", "r") as file:
        manifest = json.load(file)

    with open("./target/sources.json", "r") as file:
        sources = json.load(file)

    processed_catalog = process_catalog(catalog)
    processed_manifest = process_manifest(manifest)
    processed_sources = process_sources(sources)

    with open("./target_processed/catalog.json", "w") as file:
        json.dump(processed_catalog, file)

    with open("./target_processed/manifest.json", "w") as file:
        json.dump(processed_manifest, file)

    with open("./target_processed/sources.json", "w") as file:
        json.dump(processed_sources, file)
