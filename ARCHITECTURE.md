<h1 align="center">
    <br/><br/>
    FestivalsApp Documentation
    <br/><br/>
</h1>

<h2 align="center">
    <br/><br/>
    Backend Architecture Overview
    <br/><br/>
</h2>

<hr/>
<p align="center">
    <a href="#introduction">Introduction</a> •
    <a href="#architecture-outline">Architecture Outline</a> •
    <a href="#architectural-views">Architectural Views</a> •
    <a href="#system-properties">System Properties</a>
</p>
<hr/>

# Introduction

## Context and scope of document

This document is intended as a technical overview document of the FestivalsApp especially its underlying infrastructure and network elements,
which are necessary to operate the backend services fot the FestivalsApp. The documentation is published on github (https://github.com/Festivals-App/festivals-documentation).

# Architecture Outline

## Big Picture

The Festival App is designed to provide a comprehensive solution for managing and interacting with multiple festivals, offering users seamless access to event information,
schedules, locations, and activities across various festivals. The architecture is modular and scalable, supporting unique configurations for each festival
while maintaining a consistent user experience.

![Figure 1: Architecture Overview](https://github.com/Festivals-App/festivals-documentation/blob/main/images/architecture/overview.png "Figure 1: Architecture Overview")

At the core of the architecture is a backend server responsible for managing festival data, connected to a database that stores information about festivals, events, and locations.
In addition, a separate file server handles media assets (such as images, videos, and documents) associated with the festivals, ensuring efficient storage and retrieval of large files
without burdening the main server. The app is also designed with security and performance in mind, utilizing load balancing, service discovery, and encrypted data transmission
to handle the increasing number of festivals.

A key feature of the system is the role of festival organizers, who have dedicated access to the platform, enabling them to create and manage their own festivals.
Organizers can upload content, configure festival settings, and update event details through a secure interface. This access allows each festival to be independently managed,
while still being part of the broader FestivalsApp ecosystem.

By incorporating both a robust backend for data management and a file server for media, along with providing tools for festival organizers to directly manage their events,
the architecture ensures flexibility, scalability, and a rich user experience across platforms.

### Project Context

The FestivalsApp is an open-source project developed by me with the goal of providing a versatile platform for managing and attending multiple festivals.
As a free and community-driven solution, it offers festival organizers and attendees a powerful toolset for creating and navigating events.
The app is continually evolving thanks to contributions from the community, and to ensure its sustainability, it relies on donations to cover ongoing development and maintenance costs.
By supporting the project, users help keep the app open, accessible, and feature-rich for everyone.

### System Decomposition

Following the high level architecture overview, shown in Figure 1: Architecture Overview, the system can be split into the following system elements:

* Mobile App (not in scope for the backend infrastructure)
* Creator Tool (not in scope for the backend infrastructure)
* Gateway
* FestivalsApp Server
* Database
* File Server
* Identity Server

Along with the application-level components, the following system and technology-specific elements should also be taken into account:

* Infrastructure services (Cloud): DigitalOcean (DO)

The upcoming chapters will provide a detailed overview of the infrastructure architecture for these components.

# Architectural Views

## Logical View

The logical view highlights how data flows between components, their responsibilities,
and how they collaborate to deliver core functionality. This view offers a clear understanding of the system's architecture,
independent of specific deployment environments.

The FestivalsApp Server needs to fulfill several key tasks to support the functionality of the FestivalsApp
and other related services. These tasks include:

1. Handle User Requests and serve Festival and Event Data:
   * Process incoming user queries and requests for festival data.
   * Provide up-to-date festival and event information through the FestivlasAPI.
   * Support data filtering based on query parameters.

2. Create and Manage Data:
   * Offer functionality to create, update, and delete festival and event data (CRUD operations), including administrative tools for managing this data.

3. Validate Authentication Tokens and enforce Authorization:
   * Verify the authentication tokens (e.g., API keys, JWT) issued by the Identity Server to ensure requests are properly authenticated.
   * Implement token validation mechanisms to ensure only authenticated users can access protected resources.
   * Use the information provided by the Identity Server (such as user roles and permissions) to enforce role-based access control (RBAC).
   * Ensure that users can only access or modify data according to their assigned roles (e.g., admins vs. regular users vs. services).

4. Connect to the Festivals Database:
   * Retrieve and store festival and event data in the database.
   * Maintain consistency between the data in the database and what is presented through the FestivalsAPI.
   * Implement proper transaction handling when modifying data.
   * Ensure the connection is optimized for performance and reliability.

5. Error Handling and Logging:
   * Handle errors gracefully and log relevant events for monitoring and debugging.
   * Provide meaningful error responses to the clients (e.g., if data is missing or there's a server issue).

6. Security and Data Protection:
   * Use secure communication protocols (e.g., HTTPS, SSL/mTLS) to protect data.
   * Collaborate with the Identity Server for authentication and authorization security, focusing on data access protection.

7. Provide API Documentation and Versioning:
   * Maintain clear API documentation for developers using the server.
   * Support versioning to allow backward compatibility with older versions of the app or other services.

8. Health Monitoring and Maintenance:
   * Monitor server health, performance metrics, and provide status updates or alerts in case of issues.
  



## Deployment View
### Overview
### Statging environments
### System Building Blocks (SBB)
#### Digitalocean VMs
#### Website
#### Gateway
#### Identity Server
#### FestivalsApp Server
#### Database
#### File Server

### Interaction of components
#### mTLS Certificates
#### IP Masking
#### Management
### Operational Runtime View

# System Properties
## Scalability and Availability
## Security and Data Privacy


Graphics:
Architecture Overview X

Use case visitor X
Use case Festival Creator X
Use case Administrator X

Verification flow for data retrieval
Verification flow for data editing
Verification flow for heartbeat

Roles
  
Interaction flow for data retrieval
Interaction flow for data creation

Interaction flow for service jws authentication
Interaction flow for service API token authentication
Interaction flow for service discovery
Interaction flow for data caching
