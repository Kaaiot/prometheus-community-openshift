# Prometheus Community Kubernetes Helm Charts

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/prometheus-community)](https://artifacthub.io/packages/search?org=prometheus&cncf=true) [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Release Charts](https://github.com/prometheus-community/helm-charts/actions/workflows/release.yaml/badge.svg?branch=main) [![Releases downloads](https://img.shields.io/github/downloads/prometheus-community/helm-charts/total.svg)](https://github.com/prometheus-community/helm-charts/releases)

This functionality is in beta and is subject to change. The code is provided as-is with no warranties. Beta features are not subject to the support SLA of official GA features.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repository as follows:

```console
helm repo add kaaiot-charts https://kaaiot.github.io/prometheus-community-openshift
```

You can then run `helm search repo kaaiot-charts` to see the charts.
