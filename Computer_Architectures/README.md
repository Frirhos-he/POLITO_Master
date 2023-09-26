# CAs

Laboratories and exams of the **Computer Architectures** course of the master degree in Software Engineer of Politecnico di Torino, academic year 2022/2023.

In **Keil uVision5** projects that use **NXP LPC1768** microcontroller peripherals, the appropriate Dynamic Link Library (DLL) files must be specified to avoid errors during the debug phase:

```
Project > Options for Target... > Debug
```

If you intend to use the simulator select `Use Simulator` and set the following parameters:

```
- Dialog DLL: DARMP1.DLL
- Parameter: -pLPC1768
```

If you intend to use the debug unit select `Use ULINK2/ME Cortex Debugger` and set the following parameters:

```
- Dialog DLL: TARMP1.DLL
- Parameter: -pLPC1768
```
