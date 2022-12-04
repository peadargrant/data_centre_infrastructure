“Lights out management” is a colloquial term referring to a data centre
where IT and infrastructure related tasks are carried out remotely in so
far as possible. This leads to a situation where the data centre does
not normally have people within it for routine operations. A key goal
towards achieving lights-out management is to reduce the need to
interact with server hardware directly.

In-band management
==================

In the context of servers, in-band management refers to the use of
normal remote access features provided by the operating system and
accessed by the standard network pathways. Obviously, OS-level remote
management features should be used where possible for day-to-day tasks:

Remote command-line access
--------------------------

Common protocols would include telnet (insecure) and SSH (secure shell,
secure if set up correctly).

-   Windows servers offer PowerShell Remoting (`Enter-PSSession`).
    Various SSH server packages available. Also recently MS offer
    PowerShell remoting over SSH.

-   Linux normally ships with SSH server pre-installed, but may need to
    be enabled.

Once connected, the shell used will depend on the OS and its settings.
Normally PowerShell on Windows, Bash on Linux.

Remote command-line access is very flexible and tends to work well. SSH
clients are available for almost all OSes including phone and tablet.

Serial console
--------------

Most UNIX server OSes can provide varying degrees of command-line
functionality over a serial port. This will be discussed again
separately under Serial consoles.

Graphical desktop
-----------------

Many server OSes don’t have a desktop at all. Linux and UNIX operating
systems are traditionally installed without the desktop. Windows Server
Core also does not have a desktop.

If available, standard remote protocols such as Remote Desktop Protocol
(RDP) and Virtual Network Computing (VNC) are often used. These can be
configured in many different ways, but generally will either mirror the
local keyboard/screen or offer a separate desktop to it.

Administration tools
--------------------

There are a number of other admin tools that are very useful in a data
centre environment as well as remote access:

-   SNMP monitoring capture basic CPU, RAM and other stats. Normally
    needs to be enabled in the OS as a service.

-   Linux/UNIX systems: have a number of automation tools for running
    admin tasks (Chef, puppet) and maintaining desired-state
    configuration (CFEngine).

-   Windows systems: inbuilt Active Directory and SCCM features.

Local management
================

In a data centre, it is common to connect servers to a rackmount KVM to
enable a flip-up monitor, keyboard and mouse to be connected to a server
for installation, configuration and troubleshooting.

![In-rack KVM<span
data-label="fig:in-rack-kvm"></span>](racked_kvm){width="0.6\linewidth"}

Normally these KVM units can be connected to multiple servers
simultaneously and switched among them using buttons on the KVM itself.

Remote KVM {#sec:remote-console-access}
----------

Remote KVM units connect to in-rack servers in the normal way
(VGA/HDMI+USB/PS2), but do not have a local monitor / keyboard.

-   Within the same building, a CAT-6-based KVM offers straightforward
    extension of the console ports.

-   IP-based KVM equipment can be used to remotely plug in console
    devices, or alternatively a software client can be used on a PC.
    IP-based KVMs can have quite sophisticated management
    capabilities themselves.

For small environments or to move PCs out of noise-sensitive areas a
KVM-over-CAT6 or KVM-over-IP extender is sometimes used, which is only
able to connect to a single device.

Out-of-band management
======================

Out-of band management features are included on most server hardware.
All too often, these features go unused. Out-of-band management cards go
by a number of manufacturer-dependent names:

iDRAC:

:   integrated Dell Remote Access Controller

iLO:

:   integrated Lights Out (HP)

iLOM:

:   integrated Lights Out Management (Sun/Oracle)

IMM:

:   Integrated Management Module (IBM)

Integrated management cards are now fitted to many servers, taking the
place of many of the solutions above:

-   The management card has its own processor and runs its own embedded
    operating system.

-   Most are accessed using a web browser.

-   The management card may have its own NIC or it may be bonded onto
    one of the normal NICs. It has its own MAC address and IP
    configuration (set in BIOS).

![Dell R320 rear panel showing iDRAC NIC<span
data-label="fig:server-rear-idrac-port"></span>](dell_r320_rear){width="1.0\linewidth"}

Most management cards offer remote power on/off and reset, as well as
more powerful features: Note that regardless of the server’s power
state, the management card is normally powered constantly when the
server is plugged in.

Virtual console
---------------

Virtual console is one of the most useful features. It provides remote
KVM access that is entirely independent of the operating system.
Anything that the server shows on its hardware video output will be
shown in the virtual console.

Browser-based systems include those based on Java applets and the newer
HTML5-based systems. Additionally, most offer access over either VNC
and/or RDP protocols so that any standards-compliant client can be used.

Virtual media
-------------

Some tasks such as OS installation, rescue and cloning normally will
require physical access for USB and/or optical media. The virtual media
feature allows an ISO image on your local PC to appear in place of the
server’s inbuilt optical drive. To the server OS, this is entirely
transparent.

The virtual media feature is often directly integrated into the
browser-based remote clients described above.

System monitoring
-----------------

The iDRAC card may offer system monitoring information over standard
(SNMP) or other custom/proprietary protocols. This is in addition to and
entirely separate from any SNMP that the host OS may support.

Command-line interface
----------------------

Most management cards offer a command-line interface with varying
degrees of functionality.

On Dell iDRACs SSH can be enabled. A basic command-line shell is
available with most functionality accessible using the `racadm` command.

IPMI
----

Most management cards implement some/all of the Intelligent Platform
Management Interface (IPMI) management standard. IPMI permits servers
from different manufacturers to be controlled using IPMI clients.

OS visibility
-------------

The server operating system is not aware of the management card by
default. Some management cards can be interfaced in various ways to the
host OS, allowing the out-of-band management features to be configured
from the host OS. This depends on the particular card.

Considerations
--------------

-   Don’t wait until you need the iDRAC card in an emergency to
    configure it.

-   Consider putting management cards on a separate physical LAN
    or VLAN.

-   Direct console access can bypass a lot of security measures. Make
    sure that the iDRAC cards are suitably password protected.

-   Consider using static IPs in management (V)LAN to guard against
    failure of DHCP on main network.

-   Management card has very high level of access to server. Need to
    apply any security updates for it.

Managed network switches
------------------------

Most servers and other IT-related devices are plugged into a network
switch. In a data centre, all switches should be of the L2 managed type
where possible, offering the following possibilities:

-   Troublesome devices can be virtually unplugged from the network by
    disabling ports.

-   Assisting with network inventory by enumerating the MAC address(es)
    associated with each port.

-   Traffic associated with a particular device can be mirrored to
    another port, permitting monitoring by the NOC (such as
    using Wireshark).

-   Seggregating traffic into VLANs to isolate different parts of the IT
    workload from each other.

Managed switches may be managed over Serial (requiring modem or
Serial-to-IP box). More modern equipment can be managed over IP
(SSH/Telnet) in one of two ways:

In-band

:   management is where the management features are available over the
    same network that the switch itself is on.

Out-of-band

:   management is where the switch has a separate network interface for
    management purposes. (This can sometimes take the form of a
    configurable management VLAN number.)

Serial console access {#sec:serial-console-access}
---------------------

Some IT equipment is primarily managed via a serial port:

-   Linux and PC-based UNIX systems can be configured to provide access
    to the BASH shell via their serial port. With some additional
    configuration, the primary console can be presented here too,
    enabling kernel messages to be seen.

-   Many non-PC-based server systems (such as IBM iSeries) do not have a
    keyboard/VGA connection at all. Instead they present their main
    console on an RS232 serial port.

-   Many other IT devices can be configured/managed via a serial port,
    including networking hardware and legacy telephone systems.

This can be easily used to enable lights-out management:

-   If a NOC is in the same building, this can be extended to the NOC
    using an RS422 current loop converter (as RS232 has length limits).

-   If the NOC is many miles away, this can be connected to a serial
    console server. This is a small rackmounted box, similar in size to
    a network switch, that offers IP access to a number of serial ports
    over SSH or Telnet. (There are also virtual serial port drivers for
    PC-based tools that expect to directly connect to the device.)


