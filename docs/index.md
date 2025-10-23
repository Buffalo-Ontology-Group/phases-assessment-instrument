# Welcome to the PHASES Assessment Schema Documentation

This site provides documentation for the data schemas used in the **Promoting Health Aging Through Semantic Enrichment of Solitude Research (PHASES)** project.

## Overview

Our goal is to create consistent, findable, accessible, interoperable, and reusable (FAIR) data models for the assessment instruments used in our research. These schemas are built using the [LinkML](https://linkml.io/) framework.

From these source YAML files, we automatically generate:
* This documentation website
* JSON-Schema files for data validation
* OWL/RDF artifacts for semantic web integration

## Available Assessment Schemas

Here are the schemas for the different assessment instruments. The documentation for each is automatically generated from its source LinkML file.

* **[Yaden Self-Transcendent Experience Scale (STE-S)](yaden_schema.md)**
    * **Description:** Documents the schema for the STE-S (State, Trait-Transformative, and Trait-Often versions) developed by Yaden et al.
    * **Source File:** `src/schema/yaden_schema.yaml`

* **[ASTI Schema](asti_schema.md)**
    * **Description:** Documents the schema for Adult Self-Transcendence Inventory (ASTI) Assessment.
    * **Source File:** `src/schema/asti_schema.yaml`

* **[STE Schema](ste_schema.md)**
    * **Description:** Documents the schema for Self-Transcendence Experience (STE) Trait - Often Assessment Schema.
    * **Source File:** `src/schema/ste_schema.yaml`

* **[NEIS Schema](neis_schema.md)**
    * **Description:** Document the schema for Noetic Experiences and Integration Scale (NEIS) instrument.
    * **Source File:** `src/schema/neis_schema.yaml`

## Project Repository

The source code, including the LinkML schema files, is available on our [GitHub Repository](https://github.com/Buffalo-Ontology-Group/phases-assessment-instrument).