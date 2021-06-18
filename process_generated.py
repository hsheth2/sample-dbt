import json


def process_catalog(catalog):

    return catalog


def process_manifest(manifest):
    def process_node(node):

        if "root_path" in node:
            node["root_path"] = "/some-path/sample-dbt"

        return node

    def process_doc(doc):

        if "root_path" in doc:

            doc["root_path"] = "/some-path/sample-dbt"

        return doc

    def process_macro(macro):

        if "root_path" in macro:

            macro["root_path"] = "/some-path/sample-dbt"

        return macro

    for node_key, node in manifest["nodes"].items():
        manifest["nodes"][node_key] = process_node(node)

    for doc_key, doc in manifest["docs"].items():
        manifest["docs"][doc_key] = process_doc(doc)

    for macro_key, macro in manifest["macros"].items():
        manifest["macros"][macro_key] = process_macro(macro)

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
        json.dump(processed_catalog, file, indent=2, sort_keys=True)

    with open("./target_processed/manifest.json", "w") as file:
        json.dump(processed_manifest, file, indent=2, sort_keys=True)

    with open("./target_processed/sources.json", "w") as file:
        json.dump(processed_sources, file, indent=2, sort_keys=True)
