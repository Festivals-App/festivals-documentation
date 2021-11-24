<h1 align="center">
Project Title
</h1>

<p align="center">
   <a href="https://github.com/festivals-app/<project_path>/commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/festivals-app/<project_path>?style=flat"></a>
   <a href="https://github.com/festivals-app/<project_path>/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/festivals-app/<project_path>?style=flat"></a>
   <a href="https://github.com/Carthage/Carthage" title="Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
   <a href="./LICENSE" title="License"><img src="https://img.shields.io/github/license/festivals-app/<project_path>.svg"></a>
</p>

<p align="center">
    <a href="#overview">Overview</a> •
    <a href="#development">Development</a> •
    <a href="#deployment">Deployment</a> • 
    <a href="#usage">Usage</a> •
    <a href="#installation">Installation</a> •
    <a href="#architecture">Architecture</a> •
    <a href="#engage">Engage</a> •
    <a href="#licensing">Licensing</a>
</p>

<General description of this repository>

## Overview

<Give a nice overview of the project>

## Development

<General description of the development process and important notes about developing this repository.>

### Setup

1. Install and setup Xcode 13.1 or higher
2. Install jazzy
   ```console
   brew install jazzy
   ```
3. Install bartycrouch
   ```console
   brew install bartycrouch
   ```

### Build

<How can one build the project (if applicable)>

### Requirements

- Ubuntu 18.0+
- Go 1.15.8+
- iOS/macOS/Other 13.0+
- Xcode 13.1+
- swift-tools-version:5.3+
- [jazzy](https://github.com/realm/jazzy) 0.13.6+ for building the documentation
- [bartycrouch](https://github.com/Flinesoft/BartyCrouch) 4.8.0+ for string localization

## Deployment

<General description of the deployment process and important notes about deplyoing this repository.>

## Usage

<General description of the usage and important notes about using this repository.>

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate TimetableKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Festivals-App/<project>" ~> 0.1
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but <project> does support its use on supported platforms.

Once you have your Swift package set up, adding <project> as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/Festivals-App/<project>.git", .upToNextMajor(from: "0.1"))
]
```

## Architecture

![Figure 1: Architecture Overview Highlighted](https://github.com/Festivals-App/festivals-documentation/blob/main/images/architecture/overview.png "Figure 1: Architecture Overview Highlighted")

<General information about the place of the project in regard of the FestivalsApp project.> To find out more about architecture and technical information see the [ARCHITECTURE](./ARCHITECTURE.md) document.

The full documentation for the FestivalsApp is in the [festivals-documentation](https://github.com/festivals-app/festivals-documentation) repository. The documentation repository contains technical documents, architecture information, UI/UX specifications, and whitepapers related to this implementation.

## Engage

I welcome every contribution, whether it is a pull request or a fixed typo. The best place to discuss questions and suggestions regarding the <project> is the projects [issues](https://github.com/Festivals-App/<project>/issues) section. More general information and a good starting point if you want to get involved is the [festival-documentation](https://github.com/Festivals-App/festivals-documentation) repository.

If this doesn't fit you proposal or reason to contact me, there are some more general purpose communication channels where you can reach me, listed in the following table.

| Type                     | Channel                                                |
| ------------------------ | ------------------------------------------------------ |
| **General Discussion**   | <a href="https://github.com/festivals-app/festivals-documentation/issues/new/choose" title="General Discussion"><img src="https://img.shields.io/github/issues/festivals-app/festivals-documentation/question.svg?style=flat-square"></a> </a>   |
| **Other Requests**    | <a href="mailto:simon.cay.gaus@gmail.com" title="Email me"><img src="https://img.shields.io/badge/email-Simon-green?logo=mail.ru&style=flat-square&logoColor=white"></a>   |

## Licensing

Copyright (c) 2017-2021 Simon Gaus.

Licensed under the **GNU Lesser General Public License v3.0** (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at https://www.gnu.org/licenses/lgpl-3.0.html.

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the [LICENSE](./LICENSE) for the specific language governing permissions and limitations under the License.
