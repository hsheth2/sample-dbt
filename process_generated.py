import json


def process_catalog(catalog):

    return catalog


def process_manifest(manifest):
    def process_root_path(item):

        if "root_path" in item:
            item["root_path"] = "/some-path/sample-dbt"

        return item

    root_path_fields = ["nodes", "docs", "macros", "sources"]

    for root_path_field in root_path_fields:

        for item_key, item in manifest[root_path_field].items():
            manifest[root_path_field][item_key] = process_root_path(item)

    manifest["metadata"]["generated_at"] = "2021-06-18T21:38:36.384613Z"
    manifest["metadata"]["invocation_id"] = "just-some-random-id"

    return manifest


def process_sources(sources):
    def process_result(result):
        result["max_loaded_at_time_ago_in_s"] = 42276862.910052
        result["snapshotted_at"] = "2021-06-18T17:08:55.925443+00:00"
        return result

    sources["elapsed_time"] = 3.1415

    sources["metadata"]["generated_at"] = "2021-06-18T21:38:36.384613Z"
    sources["metadata"]["invocation_id"] = "just-some-random-id"

    sources["results"] = [process_result(result) for result in sources["results"]]

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

    with open("./target_processed/dbt_catalog.json", "w") as file:
        json.dump(processed_catalog, file, indent=2, sort_keys=True)

    with open("./target_processed/dbt_manifest.json", "w") as file:
        json.dump(processed_manifest, file, indent=2, sort_keys=True)

    with open("./target_processed/dbt_sources.json", "w") as file:
        json.dump(processed_sources, file, indent=2, sort_keys=True)
