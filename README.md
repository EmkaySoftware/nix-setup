## Repository setup

### Machine

A machine is a physical machine, each machine defines it's own configuration.  
Typically it contains configuration that is machine specific or is unlikely to change by user configuration.  
This may include, but not limited to:
- Boot configuration; kernel and boot parameters.
- Network configuration
- Hardware specific configuration, i.e. GPU drivers.
- Audio configuration

### Users 

Users define certain set of configuration specifically for the user, such as the language, time and its profile. 

### Profile

A profile is a set of features.

### Feature

A feature is the concrete installation of a certain software or a combination of.

## Diagram

```
+-----------------+
|     Machine     |
+-----------------+
         |
         | 0..*
         v
+-----------------+
|      User       |
+-----------------+
         |
         | 1
         v
+-----------------+
|     Profile     |
+-----------------+
         |
         | 0..*
         v
+-----------------+
|     Feature     |
+-----------------+
```