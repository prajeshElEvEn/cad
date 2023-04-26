LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY trafficController_TB IS
    --empty
END ENTITY;

ARCHITECTURE behaviour OF trafficController_TB IS
    COMPONENT TrafficController
        PORT (
            reset, clock : IN STD_LOGIC;
            buttonNS : IN STD_LOGIC; --Pedestrian button North & Southbound
            redNS, yellowNS, greenNS, leftNS : OUT STD_LOGIC; --Traffic lights North & Southbound
            buttonEW : IN STD_LOGIC; --Pedestrian button East & Westbound
            redEW, yellowEW, greenEW, leftEW : OUT STD_LOGIC --Traffic lights East & Westbound
        );
    END COMPONENT;

    SIGNAL reset_TB, clock_TB : STD_LOGIC;
    SIGNAL buttonNS_TB : STD_LOGIC;
    SIGNAL redNS_TB, yellowNS_TB, greenNS_TB, leftNS_TB : STD_LOGIC;
    SIGNAL buttonEW_TB : STD_LOGIC;
    SIGNAL redEW_TB, yellowEW_TB, greenEW_TB, leftEW_TB : STD_LOGIC;

BEGIN
    --DUT: Device Under Test
    DUT1 : TrafficController PORT MAP(
        reset => reset_TB,
        clock => clock_TB,
        buttonNS => buttonNS_TB,
        redNS => redNS_TB,
        yellowNS => yellowNS_TB,
        greenNS => greenNS_TB,
        leftNS => leftNS_TB,
        buttonEW => buttonEW_TB,
        redEW => redEW_TB,
        yellowEW => yellowEW_TB,
        greenEW => greenEW_TB,
        leftEW => leftEW_TB
    );

    --Clock process
    clock_process : PROCESS
    BEGIN
        clock_TB <= '0';
        WAIT FOR 10 ns;
        clock_TB <= '1';
        WAIT FOR 10 ns;
    END PROCESS;

    --Simulation
    Simluation : PROCESS
    BEGIN
        reset_TB <= '1';
        buttonNS_TB <= '0';
        buttonEW_TB <= '0';
        WAIT FOR 40 ns;
        reset_TB <= '0';
        WAIT FOR 160 ns;
        buttonNS_TB <= '1';
        WAIT FOR 40 ns;
        buttonNS_TB <= '0';
        WAIT FOR 160 ns;
        buttonEW_TB <= '1';
        WAIT FOR 40 ns;
        buttonEW_TB <= '0';
        --wait for 160 ns;
        WAIT;
    END PROCESS;

END ARCHITECTURE;
