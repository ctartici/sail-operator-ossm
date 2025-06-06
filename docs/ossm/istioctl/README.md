[Return to OSSM Docs](../)

# Installing the istioctl tool

The `istioctl` tool is a configuration command line utility that allows service 
operators to debug and diagnose Istio service mesh deployments.

## Prerequisites

- You have access to the OpenShift Container Platform web console.  

- **OpenShift Service Mesh 3** Operator is installed and running.  

- At least a `Istio` resource is already created.  

## Steps

1. Check the current running `Istio` version  

    ```bash
    oc get istio -ojsonpath="{range .items[*]}{.spec.version}{'\n'}{end}" | sed s/^v// | sort
    ```

    If there are multiple `Istio` resources, choose the later version (which is the last displayed as it is ordered with the previous command)  

1. Download `istioctl` binary

    In the OpenShift console, navigate to the Command Line Tools by clicking :grey_question: -> **Command Line Tools** in the upper-right of the header.  
    Then click on **Download istioctl**, choose the correct package according to your system (OS and architecture):

    - [Linux (x86_64, amd64)](https://mirror.openshift.com/pub/cgw/servicemesh/latest/istioctl-1.24.4-linux-amd64.tar.gz)
    - [Linux on ARM (aarch64, arm64)](https://mirror.openshift.com/pub/cgw/servicemesh/latest/istioctl-1.24.4-linux-arm64.tar.gz)
    - [MacOS (x86_64, amd64)](https://mirror.openshift.com/pub/cgw/servicemesh/latest/istioctl-1.24.4-darwin-amd64.tar.gz)
    - [MacOS on ARM (aarch64, arm64)](https://mirror.openshift.com/pub/cgw/servicemesh/latest/istioctl-1.24.4-darwin-arm64.tar.gz)
    - [Windows (x86_64, amd64)](https://mirror.openshift.com/pub/cgw/servicemesh/latest/istioctl-1.24.4-windows-amd64.zip)

1. Extract the `istioctl` binary.

    - For Linux:

    ```bash
    tar xzf istioctl-<VERSION>-<OS>-<ARCH>.tar.gz
    ```

    - For MacOS, unpack and extract the archive.

    - For Windows, use the zip software to extract the archive. 

1. Move to the uncompressed directory.

    ```bash
    cd istioctl-<OS>-<ARCH>
    ```

1. Add `istioctl` client to your path.

    ```bash
    export PATH=$PWD:$PATH
    ```

1. Confirm that the `istioctl` client version and the Istio control plane 
version now match (or are within one version) by running the following command
at the terminal:
  
    ```sh
    $ istioctl version
    ```

> [!NOTE]
> All the releases of `istioctl` are directly downloadable [here](https://mirror.openshift.com/pub/cgw/servicemesh/)

## Supported commands

|Command, aliases               | Description                                                                            | Supported          | Alternative                                                                |
|-------------------------------|----------------------------------------------------------------------------------------|--------------------|----------------------------------------------------------------------------|
| admin, istiod                 | Manage control plane (istiod) configuration                                            | :white_check_mark: |                                                                            |
| analyze                       | Analyze Istio configuration and print validation messages                              | :white_check_mark: |                                                                            |
| authz                         | (authz is experimental. Use `istioctl experimental authz`)                             | :x:                | None                                                                       |
| bug-report                    | Cluster information and log capture support tool.                                      | :x:                | Use istio-must-gather                                                      |
| completion                    | Generate the autocompletion script for the specified shell                             | :white_check_mark: |                                                                            |
| create-remote-secret          | Create a secret with credentials to allow Istio to access remote Kubernetes apiservers | :white_check_mark: |                                                                            |
| dashboard                     | Access to Istio web UIs                                                                | :x:                | see [Integrating with Kiali](../../README.md#integrating-with-kiali)       |
| experimental, x, exp          | Experimental commands that may be modified or deprecated                               | :x:                | None                                                                       |
| help                          | Help about any command                                                                 | :white_check_mark: |                                                                            |
| install                       | Applies an Istio manifest, installing or reconfiguring Istio on a cluster.             | :x:                | see [Installation on OpenShift](../../README.md#installation-on-openshift) |
| kube-inject                   | Inject Istio sidecar into Kubernetes pod resources                                     | :x:                | set the `istio-injection=enabled` label                                    |
| manifest                      | Commands related to Istio manifests                                                    | :x:                | None                                                                       |
| proxy-config, pc              | Retrieve information about proxy configuration from Envoy [kube only]                  | :white_check_mark: |                                                                            |
| proxy-status, ps              | Retrieves the synchronization status of each Envoy in the mesh                         | :white_check_mark: |                                                                            |
| remote-clusters               | Lists the remote clusters each istiod instance is connected to.                        | :white_check_mark: |                                                                            |
| tag                           | Command group used to interact with revision tags                                      | :x:                | see RevisionTag                                                            |
| uninstall                     | Uninstall Istio from a cluster                                                         | :x:                | see [Uninstalling](../../README.md#uninstalling)                           |
| upgrade                       | Upgrade Istio control plane in-place                                                   | :x:                | see [Upgrade](../../README.md#update-strategy)                             |
| validate, v                   | Validate Istio policy and rules files                                                  | :white_check_mark: |                                                                            |
| version                       | Prints out build version information                                                   | :white_check_mark: |                                                                            |
| waypoint                      | Manage waypoint configuration                                                          | :white_check_mark: |                                                                            |
| ztunnel-config                | Update or retrieve current Ztunnel configuration.                                      | :white_check_mark: |                                                                            |
