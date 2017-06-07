#!/bin/bash

# Build all subprojects that have a build.sh file.
for f in *;
  do
    if [[ -d "${f}" ]]; then
      (
        cd "${f}"
        if [[ -f "build.sh" ]]; then
          echo "Building ${f}..."
          ./build.sh
          echo "Done"
        fi
      )
    fi
  done;

gcloud config configurations activate ${1:-ddwebxr}
yes | gcloud app deploy --verbosity=info --version v1 app.yaml
