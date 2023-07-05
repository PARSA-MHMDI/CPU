/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Study/AUT/Term6/Computer Architecture/Project/project_files/ALU.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t32[16];
    char t47[16];
    char t48[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    char *t18;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned char t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t49;

LAB0:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(108, ng0);
    t1 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t32, 0, 16);
    t2 = (t0 + 4512);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 4640);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 4432);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t1 = (t0 + 7868);
    t7 = xsi_mem_cmp(t1, t5, 6U);
    if (t7 == 1)
        goto LAB6;

LAB16:    t8 = (t0 + 7874);
    t10 = xsi_mem_cmp(t8, t5, 6U);
    if (t10 == 1)
        goto LAB7;

LAB17:    t11 = (t0 + 7880);
    t13 = xsi_mem_cmp(t11, t5, 6U);
    if (t13 == 1)
        goto LAB8;

LAB18:    t14 = (t0 + 7886);
    t16 = xsi_mem_cmp(t14, t5, 6U);
    if (t16 == 1)
        goto LAB9;

LAB19:    t17 = (t0 + 7892);
    t19 = xsi_mem_cmp(t17, t5, 6U);
    if (t19 == 1)
        goto LAB10;

LAB20:    t20 = (t0 + 7898);
    t22 = xsi_mem_cmp(t20, t5, 6U);
    if (t22 == 1)
        goto LAB11;

LAB21:    t23 = (t0 + 7904);
    t25 = xsi_mem_cmp(t23, t5, 6U);
    if (t25 == 1)
        goto LAB12;

LAB22:    t26 = (t0 + 7910);
    t28 = xsi_mem_cmp(t26, t5, 6U);
    if (t28 == 1)
        goto LAB13;

LAB23:    t29 = (t0 + 7916);
    t31 = xsi_mem_cmp(t29, t5, 6U);
    if (t31 == 1)
        goto LAB14;

LAB24:
LAB15:
LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(60, ng0);
    t33 = (t0 + 1032U);
    t34 = *((char **)t33);
    t33 = (t0 + 7636U);
    t35 = (t0 + 1192U);
    t36 = *((char **)t35);
    t35 = (t0 + 7652U);
    t37 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t32, t34, t33, t36, t35);
    t38 = (t32 + 12U);
    t39 = *((unsigned int *)t38);
    t40 = (1U * t39);
    t41 = (16U != t40);
    if (t41 == 1)
        goto LAB26;

LAB27:    t42 = (t0 + 4512);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    memcpy(t46, t37, 16U);
    xsi_driver_first_trans_fast_port(t42);
    goto LAB5;

LAB7:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7636U);
    t7 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t47, t7, 17);
    t6 = (t0 + 1192U);
    t8 = *((char **)t6);
    t6 = (t0 + 7652U);
    t10 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t8, t6);
    t9 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t48, t10, 17);
    t11 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t32, t5, t47, t9, t48);
    t12 = (t32 + 12U);
    t39 = *((unsigned int *)t12);
    t40 = (1U * t39);
    t3 = (17U != t40);
    if (t3 == 1)
        goto LAB28;

LAB29:    t14 = (t0 + 4576);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t11, 17U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t39 = (16 - 15);
    t40 = (t39 * 1U);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t5 = (t0 + 4512);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t7 = (16 - 16);
    t39 = (t7 * -1);
    t40 = (1U * t39);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 4640);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB5;

LAB8:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 7636U);
    t5 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t32, t2, t1, (unsigned char)3);
    t6 = (t32 + 12U);
    t39 = *((unsigned int *)t6);
    t40 = (1U * t39);
    t3 = (16U != t40);
    if (t3 == 1)
        goto LAB30;

LAB31:    t8 = (t0 + 4512);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t5, 16U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB5;

LAB9:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t39 = (15 - 14);
    t40 = (t39 * 1U);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t5 = (t0 + 4704);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 15U);
    xsi_driver_first_trans_delta(t5, 0U, 15U, 0LL);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4704);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t3;
    xsi_driver_first_trans_delta(t1, 15U, 1, 0LL);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 4512);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t7 = (15 - 15);
    t39 = (t7 * -1);
    t40 = (1U * t39);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 4768);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4640);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB10:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t39 = (15 - 15);
    t40 = (t39 * 1U);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t5 = (t0 + 4704);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 15U);
    xsi_driver_first_trans_delta(t5, 1U, 15U, 0LL);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t7 = (0 - 15);
    t39 = (t7 * -1);
    t40 = (1U * t39);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 4768);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4704);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4640);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 4512);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB11:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t39 = (15 - 14);
    t40 = (t39 * 1U);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t5 = (t0 + 4704);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 15U);
    xsi_driver_first_trans_delta(t5, 0U, 15U, 0LL);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t7 = (15 - 15);
    t39 = (t7 * -1);
    t40 = (1U * t39);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 4640);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 4704);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 15U, 1, 0LL);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 4512);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB12:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t39 = (15 - 15);
    t40 = (t39 * 1U);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t5 = (t0 + 4704);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t1, 15U);
    xsi_driver_first_trans_delta(t5, 1U, 15U, 0LL);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t7 = (0 - 15);
    t39 = (t7 * -1);
    t40 = (1U * t39);
    t49 = (0 + t40);
    t1 = (t2 + t49);
    t3 = *((unsigned char *)t1);
    t5 = (t0 + 4640);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t3;
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 4704);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 4512);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB13:    xsi_set_current_line(98, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 7716U);
    t7 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t32, t7, 16);
    t6 = (t0 + 4512);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB5;

LAB14:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 7732U);
    t7 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t1);
    t5 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t32, t7, 16);
    t6 = (t0 + 4512);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 16U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB5;

LAB25:;
LAB26:    xsi_size_not_matching(16U, t40, 0);
    goto LAB27;

LAB28:    xsi_size_not_matching(17U, t40, 0);
    goto LAB29;

LAB30:    xsi_size_not_matching(16U, t40, 0);
    goto LAB31;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/TB_FSM_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
