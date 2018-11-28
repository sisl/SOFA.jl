let
    s, idmsf = iauA2af(4, 2.345)

    @test s == '+'

    @test idmsf[1] ==  134
    @test idmsf[2] ==   21
    @test idmsf[3] ==   30
    @test idmsf[4] == 9706
end

let
    s, ihmsf = iauA2tf(4, -3.01234,)

    @test s == '-'

    @test ihmsf[1] ==   11
    @test ihmsf[2] ==   30
    @test ihmsf[3] ==   22
    @test ihmsf[4] == 6484
end

let
    pnat = [
       -0.76321968546737951; 
       -0.60869453983060384;
       -0.21676408580639883;
    ]

    v = [
        2.1044018893653786e-5;
        -8.9108923304429319e-5;
        -3.8633714797716569e-5;
    ]

    s   = 0.99980921395708788
    bm1 = 0.99999999506209258

    ppr = iauAb(pnat, v, s, bm1)

    @test isapprox(ppr[1], -0.7631631094219556269, atol=1e-12)
    @test isapprox(ppr[2], -0.6087553082505590832, atol=1e-12)
    @test isapprox(ppr[3], -0.2167926269368471279, atol=1e-12)
end

let
    a = 5.5
    e = 1.1
    p = 0.7

    h, d = iauAe2hd(a, e, p)

    @test isapprox(h, 0.5933291115507309663, atol=1e-14)
    @test isapprox(d, 0.9613934761647817620, atol=1e-14)
end

let
    j, a = iauAf2a('-', 45, 13, 27.2)

    @test isapprox(a, -0.7893115794313644842, atol=1e-12)
    @test j == 0
end

let
    @test isapprox(iauAnp(-0.1), 6.183185307179586477, atol=1e-12)
end


let
    @test isapprox(iauAnpm(-4.0), 2.283185307179586477, atol=1e-12)
end

let
   date1 = 2456165.5
   date2 = 0.401182685
   ebpv = [
        0.901310875 -0.417402664 -0.180982288;
        0.00742727954 0.0140507459 0.00609045792;
   ]
   ehp = [
         0.903358544;
        -0.415395237;
        -0.180084014;
   ]

    astrom = iauApcg(date1, date2, ebpv, ehp)

    @test isapprox(astrom.pmt, 12.65133794027378508, atol=1e-11)
    @test isapprox(astrom.eb[1], 0.901310875, atol=1e-12)
    @test isapprox(astrom.eb[2], -0.417402664, atol=1e-12)
    @test isapprox(astrom.eb[3], -0.180982288, atol=1e-12)
    @test isapprox(astrom.eh[1], 0.8940025429324143045, atol=1e-12)
    @test isapprox(astrom.eh[2], -0.4110930268679817955, atol=1e-12)
    @test isapprox(astrom.eh[3], -0.1782189004872870264, atol=1e-12)
    @test isapprox(astrom.em, 1.010465295811013146, atol=1e-12)
    @test isapprox(astrom.v[1], 0.4289638913597693554e-4, atol=1e-16)
    @test isapprox(astrom.v[2], 0.8115034051581320575e-4, atol=1e-16)
    @test isapprox(astrom.v[3], 0.3517555136380563427e-4, atol=1e-16)
    @test isapprox(astrom.bm1, 0.9999999951686012981, atol=1e-12)
    @test astrom.bpn[1][1] == 1.0
    @test astrom.bpn[2][1] == 0.0
    @test astrom.bpn[3][1] == 0.0
    @test astrom.bpn[1][2] == 0.0
    @test astrom.bpn[2][2] == 1.0
    @test astrom.bpn[3][2] == 0.0
    @test astrom.bpn[1][3] == 0.0
    @test astrom.bpn[2][3] == 0.0
    @test astrom.bpn[3][3] == 1.0
end

let
    date1 = 2456165.5
    date2 = 0.401182685

    astrom = iauApcg13(date1, date2)

    @test isapprox(astrom.pmt, 12.65133794027378508, atol=1e-11)
    @test isapprox(astrom.eb[1], 0.9013108747340644755, atol=1e-12)
    @test isapprox(astrom.eb[2], -0.4174026640406119957, atol=1e-12)
    @test isapprox(astrom.eb[3], -0.1809822877867817771, atol=1e-12)
    @test isapprox(astrom.eh[1], 0.8940025429255499549, atol=1e-12)
    @test isapprox(astrom.eh[2], -0.4110930268331896318, atol=1e-12)
    @test isapprox(astrom.eh[3], -0.1782189006019749850, atol=1e-12)
    @test isapprox(astrom.em, 1.010465295964664178, atol=1e-12)
    @test isapprox(astrom.v[1], 0.4289638912941341125e-4, atol=1e-16)
    @test isapprox(astrom.v[2], 0.8115034032405042132e-4, atol=1e-16)
    @test isapprox(astrom.v[3], 0.3517555135536470279e-4, atol=1e-16)
    @test isapprox(astrom.bm1, 0.9999999951686013142, atol=1e-12)
    @test astrom.bpn[1][1] == 1.0
    @test astrom.bpn[2][1] == 0.0
    @test astrom.bpn[3][1] == 0.0
    @test astrom.bpn[1][2] == 0.0
    @test astrom.bpn[2][2] == 1.0
    @test astrom.bpn[3][2] == 0.0
    @test astrom.bpn[1][3] == 0.0
    @test astrom.bpn[2][3] == 0.0
    @test astrom.bpn[3][3] == 1.0
end

let
    date1 = 2456165.5
    date2 = 0.401182685
    ebpv = [
        0.901310875 -0.417402664 -0.180982288;
        0.00742727954 0.0140507459 0.00609045792;
    ]
    ehp = [
            0.903358544;
        -0.415395237;
        -0.180084014;
    ]
    x =  0.0013122272
    y = -2.92808623e-5
    s =  3.05749468e-8

    astrom = iauApci(date1, date2, ebpv, ehp, x, y, s)

    @test isapprox(astrom.pmt, 12.65133794027378508, atol=1e-11)
    @test isapprox(astrom.eb[1], 0.901310875, atol=1e-12)
    @test isapprox(astrom.eb[2], -0.417402664, atol=1e-12)
    @test isapprox(astrom.eb[3], -0.180982288, atol=1e-12)
    @test isapprox(astrom.eh[1], 0.8940025429324143045, atol=1e-12)
    @test isapprox(astrom.eh[2], -0.4110930268679817955, atol=1e-12)
    @test isapprox(astrom.eh[3], -0.1782189004872870264, atol=1e-12)
    @test isapprox(astrom.em, 1.010465295811013146, atol=1e-12)
    @test isapprox(astrom.v[1], 0.4289638913597693554e-4, atol=1e-16)
    @test isapprox(astrom.v[2], 0.8115034051581320575e-4, atol=1e-16)
    @test isapprox(astrom.v[3], 0.3517555136380563427e-4, atol=1e-16)
    @test isapprox(astrom.bm1, 0.9999999951686012981, atol=1e-12)
    @test isapprox(astrom.bpn[1][1], 0.9999991390295159156, atol=1e-12)
    @test isapprox(astrom.bpn[2][1], 0.4978650072505016932e-7, atol=1e-12)
    @test isapprox(astrom.bpn[3][1], 0.1312227200000000000e-2, atol=1e-12)
    @test isapprox(astrom.bpn[1][2], -0.1136336653771609630e-7, atol=1e-12)
    @test isapprox(astrom.bpn[2][2], 0.9999999995713154868, atol=1e-12)
    @test isapprox(astrom.bpn[3][2], -0.2928086230000000000e-4, atol=1e-12)
    @test isapprox(astrom.bpn[1][3], -0.1312227200895260194e-2, atol=1e-12)
    @test isapprox(astrom.bpn[2][3], 0.2928082217872315680e-4, atol=1e-12)
    @test isapprox(astrom.bpn[3][3], 0.9999991386008323373, atol=1e-12)
end

let
    date1 = 2456165.5
    date2 = 0.401182685

    astrom, eo = iauApci13(date1, date2)

    @test isapprox(astrom.pmt, 12.65133794027378508, atol=1e-11)
    @test isapprox(astrom.eb[1], 0.9013108747340644755, atol=1e-12)
    @test isapprox(astrom.eb[2], -0.4174026640406119957, atol=1e-12)
    @test isapprox(astrom.eb[3], -0.1809822877867817771, atol=1e-12)
    @test isapprox(astrom.eh[1], 0.8940025429255499549, atol=1e-12)
    @test isapprox(astrom.eh[2], -0.4110930268331896318, atol=1e-12)
    @test isapprox(astrom.eh[3], -0.1782189006019749850, atol=1e-12)
    @test isapprox(astrom.em, 1.010465295964664178, atol=1e-12)
    @test isapprox(astrom.v[1], 0.4289638912941341125e-4, atol=1e-16)
    @test isapprox(astrom.v[2], 0.8115034032405042132e-4, atol=1e-16)
    @test isapprox(astrom.v[3], 0.3517555135536470279e-4, atol=1e-16)
    @test isapprox(astrom.bm1, 0.9999999951686013142, atol=1e-12)
    @test isapprox(astrom.bpn[1][1], 0.9999992060376761710, atol=1e-12)
    @test isapprox(astrom.bpn[2][1], 0.4124244860106037157e-7, atol=1e-12)
    @test isapprox(astrom.bpn[3][1], 0.1260128571051709670e-2, atol=1e-12)
    @test isapprox(astrom.bpn[1][2], -0.1282291987222130690e-7, atol=1e-12)
    @test isapprox(astrom.bpn[2][2], 0.9999999997456835325, atol=1e-12)
    @test isapprox(astrom.bpn[3][2], -0.2255288829420524935e-4, atol=1e-12)
    @test isapprox(astrom.bpn[1][3], -0.1260128571661374559e-2, atol=1e-12)
    @test isapprox(astrom.bpn[2][3], 0.2255285422953395494e-4, atol=1e-12)
    @test isapprox(astrom.bpn[3][3], 0.9999992057833604343, atol=1e-12)
    @test isapprox(eo, -0.2900618712657375647e-2, atol=1e-12)
end

let
    date1 = 2456384.5
    date2 = 0.970031644
    ebpv = [
        -0.974170438 -0.211520082 -0.0917583024;
        0.00364365824 -0.0154287319 -0.00668922024
    ]
    ehp = [
        -0.973458265;
        -0.209215307;
        -0.0906996477
    ]
    x = 0.0013122272
    y = -2.92808623e-5
    s = 3.05749468e-8
    theta = 3.14540971
    elong = -0.527800806
    phi = -1.2345856
    hm = 2738.0
    xp = 2.47230737e-7
    yp = 1.82640464e-6
    sp = -3.01974337e-11
    refa = 0.000201418779
    refb = -2.36140831e-7
 

    astrom = iauApco(date1, date2, ebpv, ehp, x, y, s,
           theta, elong, phi, hm, xp, yp, sp,
           refa, refb)

    @test isapprox(astrom.pmt, 13.25248468622587269, atol=1e-11)
    @test isapprox(astrom.eb[1], -0.9741827110630322720, atol=1e-12)
    @test isapprox(astrom.eb[2], -0.2115130190135344832, atol=1e-12)
    @test isapprox(astrom.eb[3], -0.09179840186949532298, atol=1e-12)
    @test isapprox(astrom.eh[1], -0.9736425571689739035, atol=1e-12)
    @test isapprox(astrom.eh[2], -0.2092452125849330936, atol=1e-12)
    @test isapprox(astrom.eh[3], -0.09075578152243272599, atol=1e-12)
    @test isapprox(astrom.em, 0.9998233241709957653, atol=1e-12)
    @test isapprox(astrom.v[1], 0.2078704992916728762e-4, atol=1e-16)
    @test isapprox(astrom.v[2], -0.8955360107151952319e-4, atol=1e-16)
    @test isapprox(astrom.v[3], -0.3863338994288951082e-4, atol=1e-16)
    @test isapprox(astrom.bm1, 0.9999999950277561236, atol=1e-12)
    @test isapprox(astrom.bpn[1][1], 0.9999991390295159156, atol=1e-12)
    @test isapprox(astrom.bpn[2][1], 0.4978650072505016932e-7, atol=1e-12)
    @test isapprox(astrom.bpn[3][1], 0.1312227200000000000e-2, atol=1e-12)
    @test isapprox(astrom.bpn[1][2], -0.1136336653771609630e-7, atol=1e-12)
    @test isapprox(astrom.bpn[2][2], 0.9999999995713154868, atol=1e-12)
    @test isapprox(astrom.bpn[3][2], -0.2928086230000000000e-4, atol=1e-12)
    @test isapprox(astrom.bpn[1][3], -0.1312227200895260194e-2, atol=1e-12)
    @test isapprox(astrom.bpn[2][3], 0.2928082217872315680e-4, atol=1e-12)
    @test isapprox(astrom.bpn[3][3], 0.9999991386008323373, atol=1e-12)
    @test isapprox(astrom.along, -0.5278008060301974337, atol=1e-12)
    @test isapprox(astrom.xpl, 0.1133427418174939329e-5, atol=1e-17)
    @test isapprox(astrom.ypl, 0.1453347595745898629e-5, atol=1e-17)
    @test isapprox(astrom.sphi, -0.9440115679003211329, atol=1e-12)
    @test isapprox(astrom.cphi, 0.3299123514971474711, atol=1e-12)
    @test astrom.diurab == 0.0
    @test isapprox(astrom.eral, 2.617608903969802566, atol=1e-12)
    @test isapprox(astrom.refa, 0.2014187790000000000e-3, atol=1e-15)
    @test isapprox(astrom.refb, -0.2361408310000000000e-6, atol=1e-18)
end

let
    utc1 = 2456384.5
    utc2 = 0.969254051
    dut1 = 0.1550675
    elong = -0.527800806
    phi = -1.2345856
    hm = 2738.0
    xp = 2.47230737e-7
    yp = 1.82640464e-6
    phpa = 731.0
    tc = 12.8
    rh = 0.59
    wl = 0.55

   j, astrom, eo = iauApco13(utc1, utc2, dut1, elong, phi, hm, xp, yp,
                 phpa, tc, rh, wl)

    @test isapprox(astrom.pmt, 13.25248468622475727, atol=1e-11)
    @test isapprox(astrom.eb[1], -0.9741827107320875162, atol=1e-12)
    @test isapprox(astrom.eb[2], -0.2115130190489716682, atol=1e-12)
    @test isapprox(astrom.eb[3], -0.09179840189496755339, atol=1e-12)
    @test isapprox(astrom.eh[1], -0.9736425572586935247, atol=1e-12)
    @test isapprox(astrom.eh[2], -0.2092452121603336166, atol=1e-12)
    @test isapprox(astrom.eh[3], -0.09075578153885665295, atol=1e-12)
    @test isapprox(astrom.em, 0.9998233240913898141, atol=1e-12)
    @test isapprox(astrom.v[1], 0.2078704994520489246e-4, atol=1e-16)
    @test isapprox(astrom.v[2], -0.8955360133238868938e-4, atol=1e-16)
    @test isapprox(astrom.v[3], -0.3863338993055887398e-4, atol=1e-16)
    @test isapprox(astrom.bm1, 0.9999999950277561004, atol=1e-12)
    @test isapprox(astrom.bpn[1][1], 0.9999991390295147999, atol=1e-12)
    @test isapprox(astrom.bpn[2][1], 0.4978650075315529277e-7, atol=1e-12)
    @test isapprox(astrom.bpn[3][1], 0.001312227200850293372, atol=1e-12)
    @test isapprox(astrom.bpn[1][2], -0.1136336652812486604e-7, atol=1e-12)
    @test isapprox(astrom.bpn[2][2], 0.9999999995713154865, atol=1e-12)
    @test isapprox(astrom.bpn[3][2], -0.2928086230975367296e-4, atol=1e-12)
    @test isapprox(astrom.bpn[1][3], -0.001312227201745553566, atol=1e-12)
    @test isapprox(astrom.bpn[2][3], 0.2928082218847679162e-4, atol=1e-12)
    @test isapprox(astrom.bpn[3][3], 0.9999991386008312212, atol=1e-12)
    @test isapprox(astrom.along, -0.5278008060301974337, atol=1e-12)
    @test isapprox(astrom.xpl, 0.1133427418174939329e-5, atol=1e-17)
    @test isapprox(astrom.ypl, 0.1453347595745898629e-5, atol=1e-17)
    @test isapprox(astrom.sphi, -0.9440115679003211329, atol=1e-12)
    @test isapprox(astrom.cphi, 0.3299123514971474711, atol=1e-12)
    @test astrom.diurab == 0.0
    @test isapprox(astrom.eral, 2.617608909189066140, atol=1e-12)
    @test isapprox(astrom.refa, 0.2014187785940396921e-3, atol=1e-15)
    @test isapprox(astrom.refb, -0.2361408314943696227e-6, atol=1e-18)
    @test isapprox(eo, -0.003020548354802412839, atol=1e-14)
end

let
    date1 = 2456384.5
    date2 = 0.970031644
    pv = [
        -1836024.09 1056607.72 -5998795.26; 
        -77.0361767 -133.310856 0.0971855934;
    ]
    ebpv = [
        -0.974170438 -0.211520082 -0.0917583024;
        0.00364365824 -0.0154287319 -0.00668922024;
    ]
    ehp = [
        -0.973458265;
        -0.209215307;
        -0.0906996477;
    ]

    astrom = iauApcs(date1, date2, pv, ebpv, ehp)

    @test isapprox(astrom.pmt, 13.25248468622587269, atol=1e-11)
    @test isapprox(astrom.eb[1], -0.9741827110629881886, atol=1e-12)
    @test isapprox(astrom.eb[2], -0.2115130190136415986, atol=1e-12)
    @test isapprox(astrom.eb[3], -0.09179840186954412099, atol=1e-12)
    @test isapprox(astrom.eh[1], -0.9736425571689454706, atol=1e-12)
    @test isapprox(astrom.eh[2], -0.2092452125850435930, atol=1e-12)
    @test isapprox(astrom.eh[3], -0.09075578152248299218, atol=1e-12)
    @test isapprox(astrom.em, 0.9998233241709796859, atol=1e-12)
    @test isapprox(astrom.v[1], 0.2078704993282685510e-4, atol=1e-16)
    @test isapprox(astrom.v[2], -0.8955360106989405683e-4, atol=1e-16)
    @test isapprox(astrom.v[3], -0.3863338994289409097e-4, atol=1e-16)
    @test isapprox(astrom.bm1, 0.9999999950277561237, atol=1e-12)
    @test astrom.bpn[1][1] == 1
    @test astrom.bpn[2][1] == 0
    @test astrom.bpn[3][1] == 0
    @test astrom.bpn[1][2] == 0
    @test astrom.bpn[2][2] == 1
    @test astrom.bpn[3][2] == 0
    @test astrom.bpn[1][3] == 0
    @test astrom.bpn[2][3] == 0
    @test astrom.bpn[3][3] == 1
    end

let
    date1 = 2456165.5
    date2 = 0.401182685
    pv = [
        -6241497.16 401346.896 -1251136.04;
        -29.264597 -455.021831 0.0266151194;
    ]

    astrom = iauApcs13(date1, date2, pv)

    @test isapprox(astrom.pmt, 12.65133794027378508, atol=1e-11)
    @test isapprox(astrom.eb[1], 0.9012691529025250644, atol=1e-12)
    @test isapprox(astrom.eb[2], -0.4173999812023194317, atol=1e-12)
    @test isapprox(astrom.eb[3], -0.1809906511146429670, atol=1e-12)
    @test isapprox(astrom.eh[1], 0.8939939101760130792, atol=1e-12)
    @test isapprox(astrom.eh[2], -0.4111053891734021478, atol=1e-12)
    @test isapprox(astrom.eh[3], -0.1782336880636997374, atol=1e-12)
    @test isapprox(astrom.em, 1.010428384373491095, atol=1e-12)
    @test isapprox(astrom.v[1], 0.4279877294121697570e-4, atol=1e-16)
    @test isapprox(astrom.v[2], 0.7963255087052120678e-4, atol=1e-16)
    @test isapprox(astrom.v[3], 0.3517564013384691531e-4, atol=1e-16)
    @test isapprox(astrom.bm1, 0.9999999952947980978, atol=1e-12)
    @test astrom.bpn[1][1] == 1
    @test astrom.bpn[2][1] == 0
    @test astrom.bpn[3][1] == 0
    @test astrom.bpn[1][2] == 0
    @test astrom.bpn[2][2] == 1
    @test astrom.bpn[3][2] == 0
    @test astrom.bpn[1][3] == 0
    @test astrom.bpn[2][3] == 0
    @test astrom.bpn[3][3] == 1
end

let
    astrom       = iauASTROM()
    astrom.along = 1.234
    theta        = 5.678

    astrom = iauAper(theta, astrom)

    @test isapprox(astrom.eral, 6.912000000000000000, atol=1e-12)
end

let
    astrom       = iauASTROM()
    astrom.along = 1.234

    ut11 = 2456165.5
    ut12 = 0.401182685

    astrom = iauAper13(ut11, ut12, astrom)

    @test isapprox(astrom.eral, 3.316236661789694933, atol=1e-12)
end

let
    sp    = -3.01974337e-11
    theta = 3.14540971
    elong = -0.527800806
    phi   = -1.2345856
    hm    = 2738.0
    xp    = 2.47230737e-7
    yp    = 1.82640464e-6
    refa  = 0.000201418779
    refb  = -2.36140831e-7

    astrom = iauApio(sp, theta, elong, phi, hm, xp, yp, refa, refb)

    @test isapprox(astrom.along, -0.5278008060301974337, atol=1e-12)
    @test isapprox(astrom.xpl, 0.1133427418174939329e-5, atol=1e-17)
    @test isapprox(astrom.ypl, 0.1453347595745898629e-5, atol=1e-17)
    @test isapprox(astrom.sphi, -0.9440115679003211329, atol=1e-12)
    @test isapprox(astrom.cphi, 0.3299123514971474711, atol=1e-12)
    @test isapprox(astrom.diurab, 0.5135843661699913529e-6, atol=1e-12)
    @test isapprox(astrom.eral, 2.617608903969802566, atol=1e-12)
    @test isapprox(astrom.refa, 0.2014187790000000000e-3, atol=1e-15)
    @test isapprox(astrom.refb, -0.2361408310000000000e-6, atol=1e-18)
end

let
    utc1  = 2456384.5
    utc2  = 0.969254051
    dut1  = 0.1550675
    elong = -0.527800806
    phi   = -1.2345856
    hm    = 2738.0
    xp    = 2.47230737e-7
    yp    = 1.82640464e-6
    phpa  = 731.0
    tc    = 12.8
    rh    = 0.59
    wl    = 0.55

    j, astrom = iauApio13(utc1, utc2, dut1, elong, phi, hm, xp, yp,
                    phpa, tc, rh, wl)

    @test isapprox(astrom.along, -0.5278008060301974337, atol=1e-12)
    @test isapprox(astrom.xpl, 0.1133427418174939329e-5, atol=1e-17)
    @test isapprox(astrom.ypl, 0.1453347595745898629e-5, atol=1e-17)
    @test isapprox(astrom.sphi, -0.9440115679003211329, atol=1e-12)
    @test isapprox(astrom.cphi, 0.3299123514971474711, atol=1e-12)
    @test isapprox(astrom.diurab, 0.5135843661699913529e-6, atol=1e-12)
    @test isapprox(astrom.eral, 2.617608909189066140, atol=1e-12)
    @test isapprox(astrom.refa, 0.2014187785940396921e-3, atol=1e-15)
    @test isapprox(astrom.refb, -0.2361408314943696227e-6, atol=1e-18)
end

let
    rc    = 2.71
    dc    = 0.174
    pr    = 1e-5
    pd    = 5e-6
    px    = 0.1
    rv    = 55.0
    date1 = 2456165.5
    date2 = 0.401182685

    ri, di, eo = iauAtci13(rc, dc, pr, pd, px, rv, date1, date2)

    @test isapprox(ri, 2.710121572968696744, atol=1e-12)
    @test isapprox(di, 0.1729371367219539137, atol=1e-12)
    @test isapprox(eo, -0.002900618712657375647, atol=1e-14)
end

let
    date1 = 2456165.5
    date2 = 0.401182685
    astrom, eo = iauApci13(date1, date2)

    rc = 2.71
    dc = 0.174
    pr = 1e-5
    pd = 5e-6
    px = 0.1
    rv = 55.0

    ri, di = iauAtciq(rc, dc, pr, pd, px, rv, astrom)

    @test isapprox(ri, 2.710121572968696744, atol=1e-12)
    @test isapprox(di, 0.1729371367219539137, atol=1e-12)
end
###
# let
#     b = [iauLDBODY(), iauLDBODY(), iauLDBODY()]
    
#     date1 = 2456165.5;
#     date2 = 0.401182685;
#     astrom, eo = iauApci13(date1, date2)

#     rc = 2.71
#     dc = 0.174
#     pr = 1e-5
#     pd = 5e-6
#     px = 0.1
#     rv = 55.0
#     b[1].bm = 0.00028574
#     b[1].dl = 3e-10
#     b[1].pv = ((-7.81014427, -5.60956681, -1.98079819),
#                 (0.0030723249, -0.00406995477, -0.00181335842))
#     b[2].bm = 0.00095435
#     b[2].dl = 3e-9
#     b[2].pv = ((0.738098796, 4.63658692, 1.9693136),
#                (-0.00755816922, 0.00126913722, 0.000727999001))
#     b[3].bm = 1.0
#     b[3].dl = 6e-6
#     b[3].pv = ((-0.000712174377, -0.00230478303, -0.00105865966),
#                (6.29235213e-6, -3.30888387e-7, -2.96486623e-7))

#     ri, di = iauAtciqn(rc, dc, pr, pd, px, rv, astrom, 3, b)

#     @test isapprox(ri, 2.710122008104983335, atol=1e-12)
#     @test isapprox(di, 0.1729371916492767821, atol=1e-12)
# end
###

let
    date1 = 2456165.5
    date2 = 0.401182685
    astrom, eo = iauApci13(date1, date2)
    rc = 2.71
    dc = 0.174

    ri, di = iauAtciqz(rc, dc, astrom)

    @test isapprox(ri, 2.709994899247256984, atol=1e-12)
    @test isapprox(di, 0.1728740720984931891, atol=1e-12)
end

let
    rc    = 2.71
    dc    = 0.174
    pr    = 1e-5
    pd    = 5e-6
    px    = 0.1
    rv    = 55.0
    utc1  = 2456384.5
    utc2  = 0.969254051
    dut1  = 0.1550675
    elong = -0.527800806
    phi   = -1.2345856
    hm    = 2738.0
    xp    = 2.47230737e-7
    yp    = 1.82640464e-6
    phpa  = 731.0
    tc    = 12.8
    rh    = 0.59
    wl    = 0.55

    j, aob, zob, hob, dob, rob, eo = iauAtco13(rc, dc, pr, pd, px, rv,
                    utc1, utc2, dut1, elong, phi, hm, xp, yp,
                    phpa, tc, rh, wl)

    @test isapprox(aob, 0.09251774485385390973, atol=1e-12)
    @test isapprox(zob, 1.407661405256671703, atol=1e-12)
    @test isapprox(hob, -0.09265154431430045141, atol=1e-12)
    @test isapprox(dob, 0.1716626560074556029, atol=1e-12)
    @test isapprox(rob, 2.710260453503366591, atol=1e-12)
    @test isapprox(eo, -0.003020548354802412839, atol=1e-14)
    @test j == 0
end

let
    ri    = 2.710121572969038991
    di    = 0.1729371367218230438
    date1 = 2456165.5
    date2 = 0.401182685

    rc, dc, eo = iauAtic13(ri, di, date1, date2)

    @test isapprox(rc, 2.710126504531716819, atol=1e-12)
    @test isapprox(dc, 0.1740632537627034482, atol=1e-12)
    @test isapprox(eo, -0.002900618712657375647, atol=1e-14)
end

let
    date1 = 2456165.5
    date2 = 0.401182685
    astrom, eo = iauApci13(date1, date2)
    ri = 2.710121572969038991
    di = 0.1729371367218230438

    rc, dc = iauAticq(ri, di, astrom)

    @test isapprox(rc, 2.710126504531716819, atol=1e-12)
    @test isapprox(dc, 0.1740632537627034482, atol=1e-12)
end

# let
#     b = [iauLDBODY(), iauLDBODY(), iauLDBODY()]
#     date1 = 2456165.5
#     date2 = 0.401182685
#     astrom, eo = iauApci13(date1, date2)
#     ri = 2.709994899247599271
#     di = 0.1728740720983623469
#     b[1].bm = 0.00028574
#     b[1].dl = 3e-10
#     b[1].pv = (
#         (-7.81014427 , -5.60956681, -1.98079819), 
#         (0.0030723249, -0.00406995477, -0.00181335842)
#     )
#     b[2].bm = 0.00095435
#     b[2].dl = 3e-9
#     b[2].pv = (
#         (0.738098796 , 4.63658692, 1.9693136), 
#         (-0.00755816922, 0.00126913722, 0.000727999001)
#     )
#     b[3].bm = 1.0
#     b[3].dl = 6e-6
#     b[3].pv = (
#         (-0.000712174377, -0.00230478303, -0.00105865966), 
#         (6.29235213e-6, -3.30888387e-7, -2.96486623e-7)
#     )

#     rc, dc = iauAticqn(ri, di, astrom, 3, b)

#     @test isapprox(rc, 2.709999575033027333, atol=1e-12)
#     @test isapprox(dc, 0.1739999656316469990, atol=1e-12)
# end

let
    ri    = 2.710121572969038991
    di    = 0.1729371367218230438
    utc1  = 2456384.5
    utc2  = 0.969254051
    dut1  = 0.1550675
    elong = -0.527800806
    phi   = -1.2345856
    hm    = 2738.0
    xp    = 2.47230737e-7
    yp    = 1.82640464e-6
    phpa  = 731.0
    tc    = 12.8
    rh    = 0.59
    wl    = 0.55

    j, aob, zob, hob, dob, rob = iauAtio13(ri, di, utc1, utc2, dut1, elong, phi, hm,
                    xp, yp, phpa, tc, rh, wl)

    @test isapprox(aob, 0.09233952224794989993, atol=1e-12)
    @test isapprox(zob, 1.407758704513722461, atol=1e-12)
    @test isapprox(hob, -0.09247619879782006106, atol=1e-12)
    @test isapprox(dob, 0.1717653435758265198, atol=1e-12)
    @test isapprox(rob, 2.710085107986886201, atol=1e-12)
    @test j == 0
end

let
    utc1   = 2456384.5
    utc2   = 0.969254051
    dut1   = 0.1550675
    elong  = -0.527800806
    phi    = -1.2345856
    hm     = 2738.0
    xp     = 2.47230737e-7
    yp     = 1.82640464e-6
    phpa   = 731.0
    tc     = 12.8
    rh     = 0.59
    wl     = 0.55
    j, astrom = iauApio13(utc1, utc2, dut1, elong, phi, hm, xp, yp,
                        phpa, tc, rh, wl)

    ri = 2.710121572969038991
    di = 0.1729371367218230438

    aob, zob, hob, dob, rob = iauAtioq(ri, di, astrom)

    @test isapprox(aob, 0.09233952224794989993, atol=1e-12)
    @test isapprox(zob, 1.407758704513722461, atol=1e-12)
    @test isapprox(hob, -0.09247619879782006106, atol=1e-12)
    @test isapprox(dob, 0.1717653435758265198, atol=1e-12)
    @test isapprox(rob, 2.710085107986886201, atol=1e-12)
end

let
    utc1  = 2456384.5
    utc2  = 0.969254051
    dut1  = 0.1550675
    elong = -0.527800806
    phi   = -1.2345856
    hm    = 2738.0
    xp    = 2.47230737e-7
    yp    = 1.82640464e-6
    phpa  = 731.0
    tc    = 12.8
    rh    = 0.59
    wl    = 0.55

    ob1 = 2.710085107986886201
    ob2 = 0.1717653435758265198
    j, rc, dc = iauAtoc13('R', ob1, ob2, utc1, utc2, dut1,
                    elong, phi, hm, xp, yp, phpa, tc, rh, wl)
    @test isapprox(rc, 2.709956744660731630, atol=1e-12)
    @test isapprox(dc, 0.1741696500896438967, atol=1e-12)
    @test j == 0

    ob1 = -0.09247619879782006106
    ob2 = 0.1717653435758265198
    j, rc, dc = iauAtoc13('H', ob1, ob2, utc1, utc2, dut1,
                    elong, phi, hm, xp, yp, phpa, tc, rh, wl)
    @test isapprox(rc, 2.709956744660731630, atol=1e-12)
    @test isapprox(dc, 0.1741696500896438967, atol=1e-12)
    @test j == 0

    ob1 = 0.09233952224794989993
    ob2 = 1.407758704513722461
    j, rc, dc = iauAtoc13('A', ob1, ob2, utc1, utc2, dut1,
                    elong, phi, hm, xp, yp, phpa, tc, rh, wl)
    @test isapprox(rc, 2.709956744660731630, atol=1e-12)
    @test isapprox(dc, 0.1741696500896438970, atol=1e-12)
    @test j == 0 
end

let
    utc1  = 2456384.5
    utc2  = 0.969254051
    dut1  = 0.1550675
    elong = -0.527800806
    phi   = -1.2345856
    hm    = 2738.0
    xp    = 2.47230737e-7
    yp    = 1.82640464e-6
    phpa  = 731.0
    tc    = 12.8
    rh    = 0.59
    wl    = 0.55

    ob1 = 2.710085107986886201
    ob2 = 0.1717653435758265198
    j, ri, di = iauAtoi13('R', ob1, ob2, utc1, utc2, dut1,
                    elong, phi, hm, xp, yp, phpa, tc, rh, wl)
    @test isapprox(ri, 2.710121574449135955, atol=1e-12)
    @test isapprox(di, 0.1729371839114567725, atol=1e-12)
    @test j == 0

    ob1 = -0.09247619879782006106
    ob2 = 0.1717653435758265198
    j, ri, di = iauAtoi13('H', ob1, ob2, utc1, utc2, dut1,
                    elong, phi, hm, xp, yp, phpa, tc, rh, wl)
    @test isapprox(ri, 2.710121574449135955, atol=1e-12)
    @test isapprox(di, 0.1729371839114567725, atol=1e-12)
    @test j == 0

    ob1 = 0.09233952224794989993
    ob2 = 1.407758704513722461
    j, ri, di = iauAtoi13('A', ob1, ob2, utc1, utc2, dut1,
                    elong, phi, hm, xp, yp, phpa, tc, rh, wl)
    @test isapprox(ri, 2.710121574449135955, atol=1e-12)
    @test isapprox(di, 0.1729371839114567728, atol=1e-12)
    @test j == 0
end

let
    utc1  = 2456384.5
    utc2  = 0.969254051
    dut1  = 0.1550675
    elong = -0.527800806
    phi   = -1.2345856
    hm    = 2738.0
    xp    = 2.47230737e-7
    yp    = 1.82640464e-6
    phpa  = 731.0
    tc    = 12.8
    rh    = 0.59
    wl    = 0.55
    j, astrom = iauApio13(utc1, utc2, dut1, elong, phi, hm, xp, yp,
                        phpa, tc, rh, wl)

    ob1 = 2.710085107986886201
    ob2 = 0.1717653435758265198
    ri, di = iauAtoiq('R', ob1, ob2, astrom)
    @test isapprox(ri, 2.710121574449135955, atol=1e-12)
    @test isapprox(di, 0.1729371839114567725, atol=1e-12)

    ob1 = -0.09247619879782006106
    ob2 = 0.1717653435758265198
    ri, di = iauAtoiq('H', ob1, ob2, astrom)
    @test isapprox(ri, 2.710121574449135955, atol=1e-12)
    @test isapprox(di, 0.1729371839114567725, atol=1e-12)

    ob1 = 0.09233952224794989993
    ob2 = 1.407758704513722461
    ri, di = iauAtoiq('A', ob1, ob2, astrom)
    @test isapprox(ri, 2.710121574449135955, atol=1e-12)
    @test isapprox(di, 0.1729371839114567728, atol=1e-12)
end

let
    dpsibi, depsbi, dra = iauBi00()

    @test isapprox(dpsibi, -0.2025309152835086613e-6, atol=1e-12)
    @test isapprox(depsbi, -0.3306041454222147847e-7, atol=1e-12)
    @test isapprox(dra, -0.7078279744199225506e-7, atol=1e-12)
end

let
   rb, rp, rbp = iauBp00(2400000.5, 50123.9999)

   @test isapprox(rb[1, 1], 0.9999999999999942498, atol=1e-12)
   @test isapprox(rb[1, 2], -0.7078279744199196626e-7, atol=1e-16)
   @test isapprox(rb[1, 3], 0.8056217146976134152e-7, atol=1e-16)
   @test isapprox(rb[2, 1], 0.7078279477857337206e-7, atol=1e-16)
   @test isapprox(rb[2, 2], 0.9999999999999969484, atol=1e-12)
   @test isapprox(rb[2, 3], 0.3306041454222136517e-7, atol=1e-16)
   @test isapprox(rb[3, 1], -0.8056217380986972157e-7, atol=1e-16)
   @test isapprox(rb[3, 2], -0.3306040883980552500e-7, atol=1e-16)
   @test isapprox(rb[3, 3], 0.9999999999999962084, atol=1e-12)

   @test isapprox(rp[1, 1], 0.9999995504864048241, atol=1e-12)
   @test isapprox(rp[1, 2], 0.8696113836207084411e-3, atol=1e-14)
   @test isapprox(rp[1, 3], 0.3778928813389333402e-3, atol=1e-14)
   @test isapprox(rp[2, 1], -0.8696113818227265968e-3, atol=1e-14)
   @test isapprox(rp[2, 2], 0.9999996218879365258, atol=1e-12)
   @test isapprox(rp[2, 3], -0.1690679263009242066e-6, atol=1e-14)
   @test isapprox(rp[3, 1], -0.3778928854764695214e-3, atol=1e-14)
   @test isapprox(rp[3, 2], -0.1595521004195286491e-6, atol=1e-14)
   @test isapprox(rp[3, 3], 0.9999999285984682756, atol=1e-12)

   @test isapprox(rbp[1, 1], 0.9999995505175087260, atol=1e-12)
   @test isapprox(rbp[1, 2], 0.8695405883617884705e-3, atol=1e-14)
   @test isapprox(rbp[1, 3], 0.3779734722239007105e-3, atol=1e-14)
   @test isapprox(rbp[2, 1], -0.8695405990410863719e-3, atol=1e-14)
   @test isapprox(rbp[2, 2], 0.9999996219494925900, atol=1e-12)
   @test isapprox(rbp[2, 3], -0.1360775820404982209e-6, atol=1e-14)
   @test isapprox(rbp[3, 1], -0.3779734476558184991e-3, atol=1e-14)
   @test isapprox(rbp[3, 2], -0.1925857585832024058e-6, atol=1e-14)
   @test isapprox(rbp[3, 3], 0.9999999285680153377, atol=1e-12)
end

let
   rb, rp, rbp = iauBp06(2400000.5, 50123.9999)

   @test isapprox(rb[1, 1], 0.9999999999999942497, atol=1e-12)
   @test isapprox(rb[1, 2], -0.7078368960971557145e-7, atol=1e-14)
   @test isapprox(rb[1, 3], 0.8056213977613185606e-7, atol=1e-14)
   @test isapprox(rb[2, 1], 0.7078368694637674333e-7, atol=1e-14)
   @test isapprox(rb[2, 2], 0.9999999999999969484, atol=1e-12)
   @test isapprox(rb[2, 3], 0.3305943742989134124e-7, atol=1e-14)
   @test isapprox(rb[3, 1], -0.8056214211620056792e-7, atol=1e-14)
   @test isapprox(rb[3, 2], -0.3305943172740586950e-7, atol=1e-14)
   @test isapprox(rb[3, 3], 0.9999999999999962084, atol=1e-12)

   @test isapprox(rp[1, 1], 0.9999995504864960278, atol=1e-12)
   @test isapprox(rp[1, 2], 0.8696112578855404832e-3, atol=1e-14)
   @test isapprox(rp[1, 3], 0.3778929293341390127e-3, atol=1e-14)
   @test isapprox(rp[2, 1], -0.8696112560510186244e-3, atol=1e-14)
   @test isapprox(rp[2, 2], 0.9999996218880458820, atol=1e-12)
   @test isapprox(rp[2, 3], -0.1691646168941896285e-6, atol=1e-14)
   @test isapprox(rp[3, 1], -0.3778929335557603418e-3, atol=1e-14)
   @test isapprox(rp[3, 2], -0.1594554040786495076e-6, atol=1e-14)
   @test isapprox(rp[3, 3], 0.9999999285984501222, atol=1e-12)

   @test isapprox(rbp[1, 1], 0.9999995505176007047, atol=1e-12)
   @test isapprox(rbp[1, 2], 0.8695404617348208406e-3, atol=1e-14)
   @test isapprox(rbp[1, 3], 0.3779735201865589104e-3, atol=1e-14)
   @test isapprox(rbp[2, 1], -0.8695404723772031414e-3, atol=1e-14)
   @test isapprox(rbp[2, 2], 0.9999996219496027161, atol=1e-12)
   @test isapprox(rbp[2, 3], -0.1361752497080270143e-6, atol=1e-14)
   @test isapprox(rbp[3, 1], -0.3779734957034089490e-3, atol=1e-14)
   @test isapprox(rbp[3, 2], -0.1924880847894457113e-6, atol=1e-14)
   @test isapprox(rbp[3, 3], 0.9999999285679971958, atol=1e-12)
end

let
    rbpn = zeros(Float64, 3, 3)
    rbpn[1, 1] =  9.999962358680738e-1
    rbpn[1, 2] = -2.516417057665452e-3
    rbpn[1, 3] = -1.093569785342370e-3

    rbpn[2, 1] =  2.516462370370876e-3
    rbpn[2, 2] =  9.999968329010883e-1
    rbpn[2, 3] =  4.006159587358310e-5

    rbpn[3, 1] =  1.093465510215479e-3
    rbpn[3, 2] = -4.281337229063151e-5
    rbpn[3, 3] =  9.999994012499173e-1

    x, y = iauBpn2xy(rbpn)

    @test isapprox(x,  1.093465510215479e-3, atol=1e-12)
    @test isapprox(y, -4.281337229063151e-5, atol=1e-12)
end

# let
#    double rc2i[3][3];


#    iauC2i00a(2400000.5, 53736.0, rc2i);

#    @test isapprox(rc2i[0][0], 0.9999998323037165557, 1e-12,
#        "iauC2i00a", "11", status);
#    @test isapprox(rc2i[0][1], 0.5581526348992140183e-9, 1e-12,
#        "iauC2i00a", "12", status);
#    @test isapprox(rc2i[0][2], -0.5791308477073443415e-3, 1e-12,
#        "iauC2i00a", "13", status);

#    @test isapprox(rc2i[1][0], -0.2384266227870752452e-7, 1e-12,
#        "iauC2i00a", "21", status);
#    @test isapprox(rc2i[1][1], 0.9999999991917405258, 1e-12,
#        "iauC2i00a", "22", status);
#    @test isapprox(rc2i[1][2], -0.4020594955028209745e-4, 1e-12,
#        "iauC2i00a", "23", status);

#    @test isapprox(rc2i[2][0], 0.5791308472168152904e-3, 1e-12,
#        "iauC2i00a", "31", status);
#    @test isapprox(rc2i[2][1], 0.4020595661591500259e-4, 1e-12,
#        "iauC2i00a", "32", status);
#    @test isapprox(rc2i[2][2], 0.9999998314954572304, 1e-12,
#        "iauC2i00a", "33", status);
# end

# let
#    double rc2i[3][3];


#    iauC2i00b(2400000.5, 53736.0, rc2i);

#    @test isapprox(rc2i[0][0], 0.9999998323040954356, 1e-12,
#        "iauC2i00b", "11", status);
#    @test isapprox(rc2i[0][1], 0.5581526349131823372e-9, 1e-12,
#        "iauC2i00b", "12", status);
#    @test isapprox(rc2i[0][2], -0.5791301934855394005e-3, 1e-12,
#        "iauC2i00b", "13", status);

#    @test isapprox(rc2i[1][0], -0.2384239285499175543e-7, 1e-12,
#        "iauC2i00b", "21", status);
#    @test isapprox(rc2i[1][1], 0.9999999991917574043, 1e-12,
#        "iauC2i00b", "22", status);
#    @test isapprox(rc2i[1][2], -0.4020552974819030066e-4, 1e-12,
#        "iauC2i00b", "23", status);

#    @test isapprox(rc2i[2][0], 0.5791301929950208873e-3, 1e-12,
#        "iauC2i00b", "31", status);
#    @test isapprox(rc2i[2][1], 0.4020553681373720832e-4, 1e-12,
#        "iauC2i00b", "32", status);
#    @test isapprox(rc2i[2][2], 0.9999998314958529887, 1e-12,
#        "iauC2i00b", "33", status);
# end

# let
#    double rc2i[3][3];


#    iauC2i06a(2400000.5, 53736.0, rc2i);

#    @test isapprox(rc2i[0][0], 0.9999998323037159379, 1e-12,
#        "iauC2i06a", "11", status);
#    @test isapprox(rc2i[0][1], 0.5581121329587613787e-9, 1e-12,
#        "iauC2i06a", "12", status);
#    @test isapprox(rc2i[0][2], -0.5791308487740529749e-3, 1e-12,
#        "iauC2i06a", "13", status);

#    @test isapprox(rc2i[1][0], -0.2384253169452306581e-7, 1e-12,
#        "iauC2i06a", "21", status);
#    @test isapprox(rc2i[1][1], 0.9999999991917467827, 1e-12,
#        "iauC2i06a", "22", status);
#    @test isapprox(rc2i[1][2], -0.4020579392895682558e-4, 1e-12,
#        "iauC2i06a", "23", status);

#    @test isapprox(rc2i[2][0], 0.5791308482835292617e-3, 1e-12,
#        "iauC2i06a", "31", status);
#    @test isapprox(rc2i[2][1], 0.4020580099454020310e-4, 1e-12,
#        "iauC2i06a", "32", status);
#    @test isapprox(rc2i[2][2], 0.9999998314954628695, 1e-12,
#        "iauC2i06a", "33", status);
# end

# let
#    double rbpn[3][3], rc2i[3][3];


#    rbpn[0][0] =  9.999962358680738e-1;
#    rbpn[0][1] = -2.516417057665452e-3;
#    rbpn[0][2] = -1.093569785342370e-3;

#    rbpn[1][0] =  2.516462370370876e-3;
#    rbpn[1][1] =  9.999968329010883e-1;
#    rbpn[1][2] =  4.006159587358310e-5;

#    rbpn[2][0] =  1.093465510215479e-3;
#    rbpn[2][1] = -4.281337229063151e-5;
#    rbpn[2][2] =  9.999994012499173e-1;

#    iauC2ibpn(2400000.5, 50123.9999, rbpn, rc2i);

#    @test isapprox(rc2i[0][0], 0.9999994021664089977, 1e-12,
#        "iauC2ibpn", "11", status);
#    @test isapprox(rc2i[0][1], -0.3869195948017503664e-8, 1e-12,
#        "iauC2ibpn", "12", status);
#    @test isapprox(rc2i[0][2], -0.1093465511383285076e-2, 1e-12,
#        "iauC2ibpn", "13", status);

#    @test isapprox(rc2i[1][0], 0.5068413965715446111e-7, 1e-12,
#        "iauC2ibpn", "21", status);
#    @test isapprox(rc2i[1][1], 0.9999999990835075686, 1e-12,
#        "iauC2ibpn", "22", status);
#    @test isapprox(rc2i[1][2], 0.4281334246452708915e-4, 1e-12,
#        "iauC2ibpn", "23", status);

#    @test isapprox(rc2i[2][0], 0.1093465510215479000e-2, 1e-12,
#        "iauC2ibpn", "31", status);
#    @test isapprox(rc2i[2][1], -0.4281337229063151000e-4, 1e-12,
#        "iauC2ibpn", "32", status);
#    @test isapprox(rc2i[2][2], 0.9999994012499173103, 1e-12,
#        "iauC2ibpn", "33", status);
# end

# let
#    double x, y, rc2i[3][3];


#    x = 0.5791308486706011000e-3;
#    y = 0.4020579816732961219e-4;

#    iauC2ixy(2400000.5, 53736, x, y, rc2i);

#    @test isapprox(rc2i[0][0], 0.9999998323037157138, 1e-12,
#        "iauC2ixy", "11", status);
#    @test isapprox(rc2i[0][1], 0.5581526349032241205e-9, 1e-12,
#        "iauC2ixy", "12", status);
#    @test isapprox(rc2i[0][2], -0.5791308491611263745e-3, 1e-12,
#        "iauC2ixy", "13", status);

#    @test isapprox(rc2i[1][0], -0.2384257057469842953e-7, 1e-12,
#        "iauC2ixy", "21", status);
#    @test isapprox(rc2i[1][1], 0.9999999991917468964, 1e-12,
#        "iauC2ixy", "22", status);
#    @test isapprox(rc2i[1][2], -0.4020579110172324363e-4, 1e-12,
#        "iauC2ixy", "23", status);

#    @test isapprox(rc2i[2][0], 0.5791308486706011000e-3, 1e-12,
#        "iauC2ixy", "31", status);
#    @test isapprox(rc2i[2][1], 0.4020579816732961219e-4, 1e-12,
#        "iauC2ixy", "32", status);
#    @test isapprox(rc2i[2][2], 0.9999998314954627590, 1e-12,
#        "iauC2ixy", "33", status);
# end

# let
#    double x, y, s, rc2i[3][3];


#    x =  0.5791308486706011000e-3;
#    y =  0.4020579816732961219e-4;
#    s = -0.1220040848472271978e-7;

#    iauC2ixys(x, y, s, rc2i);

#    @test isapprox(rc2i[0][0], 0.9999998323037157138, 1e-12,
#        "iauC2ixys", "11", status);
#    @test isapprox(rc2i[0][1], 0.5581984869168499149e-9, 1e-12,
#        "iauC2ixys", "12", status);
#    @test isapprox(rc2i[0][2], -0.5791308491611282180e-3, 1e-12,
#        "iauC2ixys", "13", status);

#    @test isapprox(rc2i[1][0], -0.2384261642670440317e-7, 1e-12,
#        "iauC2ixys", "21", status);
#    @test isapprox(rc2i[1][1], 0.9999999991917468964, 1e-12,
#        "iauC2ixys", "22", status);
#    @test isapprox(rc2i[1][2], -0.4020579110169668931e-4, 1e-12,
#        "iauC2ixys", "23", status);

#    @test isapprox(rc2i[2][0], 0.5791308486706011000e-3, 1e-12,
#        "iauC2ixys", "31", status);
#    @test isapprox(rc2i[2][1], 0.4020579816732961219e-4, 1e-12,
#        "iauC2ixys", "32", status);
#    @test isapprox(rc2i[2][2], 0.9999998314954627590, 1e-12,
#        "iauC2ixys", "33", status);
# end

# let
#    double p[3], theta, phi;


#    p[0] = 100.0;
#    p[1] = -50.0;
#    p[2] =  25.0;

#    iauC2s(p, &theta, &phi);

#    @test isapprox(theta, -0.4636476090008061162, 1e-14, "iauC2s", "theta", status);
#    @test isapprox(phi, 0.2199879773954594463, 1e-14, "iauC2s", "phi", status);
# end

# let
#    double tta, ttb, uta, utb, xp, yp, rc2t[3][3];


#    tta = 2400000.5;
#    uta = 2400000.5;
#    ttb = 53736.0;
#    utb = 53736.0;
#    xp = 2.55060238e-7;
#    yp = 1.860359247e-6;

#    iauC2t00a(tta, ttb, uta, utb, xp, yp, rc2t);

#    @test isapprox(rc2t[0][0], -0.1810332128307182668, 1e-12,
#        "iauC2t00a", "11", status);
#    @test isapprox(rc2t[0][1], 0.9834769806938457836, 1e-12,
#        "iauC2t00a", "12", status);
#    @test isapprox(rc2t[0][2], 0.6555535638688341725e-4, 1e-12,
#        "iauC2t00a", "13", status);

#    @test isapprox(rc2t[1][0], -0.9834768134135984552, 1e-12,
#        "iauC2t00a", "21", status);
#    @test isapprox(rc2t[1][1], -0.1810332203649520727, 1e-12,
#        "iauC2t00a", "22", status);
#    @test isapprox(rc2t[1][2], 0.5749801116141056317e-3, 1e-12,
#        "iauC2t00a", "23", status);

#    @test isapprox(rc2t[2][0], 0.5773474014081406921e-3, 1e-12,
#        "iauC2t00a", "31", status);
#    @test isapprox(rc2t[2][1], 0.3961832391770163647e-4, 1e-12,
#        "iauC2t00a", "32", status);
#    @test isapprox(rc2t[2][2], 0.9999998325501692289, 1e-12,
#        "iauC2t00a", "33", status);
# end

# let
#    double tta, ttb, uta, utb, xp, yp, rc2t[3][3];


#    tta = 2400000.5;
#    uta = 2400000.5;
#    ttb = 53736.0;
#    utb = 53736.0;
#    xp = 2.55060238e-7;
#    yp = 1.860359247e-6;

#    iauC2t00b(tta, ttb, uta, utb, xp, yp, rc2t);

#    @test isapprox(rc2t[0][0], -0.1810332128439678965, 1e-12,
#        "iauC2t00b", "11", status);
#    @test isapprox(rc2t[0][1], 0.9834769806913872359, 1e-12,
#        "iauC2t00b", "12", status);
#    @test isapprox(rc2t[0][2], 0.6555565082458415611e-4, 1e-12,
#        "iauC2t00b", "13", status);

#    @test isapprox(rc2t[1][0], -0.9834768134115435923, 1e-12,
#        "iauC2t00b", "21", status);
#    @test isapprox(rc2t[1][1], -0.1810332203784001946, 1e-12,
#        "iauC2t00b", "22", status);
#    @test isapprox(rc2t[1][2], 0.5749793922030017230e-3, 1e-12,
#        "iauC2t00b", "23", status);

#    @test isapprox(rc2t[2][0], 0.5773467471863534901e-3, 1e-12,
#        "iauC2t00b", "31", status);
#    @test isapprox(rc2t[2][1], 0.3961790411549945020e-4, 1e-12,
#        "iauC2t00b", "32", status);
#    @test isapprox(rc2t[2][2], 0.9999998325505635738, 1e-12,
#        "iauC2t00b", "33", status);
# end

# let
#    double tta, ttb, uta, utb, xp, yp, rc2t[3][3];


#    tta = 2400000.5;
#    uta = 2400000.5;
#    ttb = 53736.0;
#    utb = 53736.0;
#    xp = 2.55060238e-7;
#    yp = 1.860359247e-6;

#    iauC2t06a(tta, ttb, uta, utb, xp, yp, rc2t);

#    @test isapprox(rc2t[0][0], -0.1810332128305897282, 1e-12,
#        "iauC2t06a", "11", status);
#    @test isapprox(rc2t[0][1], 0.9834769806938592296, 1e-12,
#        "iauC2t06a", "12", status);
#    @test isapprox(rc2t[0][2], 0.6555550962998436505e-4, 1e-12,
#        "iauC2t06a", "13", status);

#    @test isapprox(rc2t[1][0], -0.9834768134136214897, 1e-12,
#        "iauC2t06a", "21", status);
#    @test isapprox(rc2t[1][1], -0.1810332203649130832, 1e-12,
#        "iauC2t06a", "22", status);
#    @test isapprox(rc2t[1][2], 0.5749800844905594110e-3, 1e-12,
#        "iauC2t06a", "23", status);

#    @test isapprox(rc2t[2][0], 0.5773474024748545878e-3, 1e-12,
#        "iauC2t06a", "31", status);
#    @test isapprox(rc2t[2][1], 0.3961816829632690581e-4, 1e-12,
#        "iauC2t06a", "32", status);
#    @test isapprox(rc2t[2][2], 0.9999998325501747785, 1e-12,
#        "iauC2t06a", "33", status);
# end

# let
#    double rc2i[3][3], era, rpom[3][3], rc2t[3][3];


#    rc2i[0][0] =  0.9999998323037164738;
#    rc2i[0][1] =  0.5581526271714303683e-9;
#    rc2i[0][2] = -0.5791308477073443903e-3;

#    rc2i[1][0] = -0.2384266227524722273e-7;
#    rc2i[1][1] =  0.9999999991917404296;
#    rc2i[1][2] = -0.4020594955030704125e-4;

#    rc2i[2][0] =  0.5791308472168153320e-3;
#    rc2i[2][1] =  0.4020595661593994396e-4;
#    rc2i[2][2] =  0.9999998314954572365;

#    era = 1.75283325530307;

#    rpom[0][0] =  0.9999999999999674705;
#    rpom[0][1] = -0.1367174580728847031e-10;
#    rpom[0][2] =  0.2550602379999972723e-6;

#    rpom[1][0] =  0.1414624947957029721e-10;
#    rpom[1][1] =  0.9999999999982694954;
#    rpom[1][2] = -0.1860359246998866338e-5;

#    rpom[2][0] = -0.2550602379741215275e-6;
#    rpom[2][1] =  0.1860359247002413923e-5;
#    rpom[2][2] =  0.9999999999982369658;


#    iauC2tcio(rc2i, era, rpom, rc2t);

#    @test isapprox(rc2t[0][0], -0.1810332128307110439, 1e-12,
#        "iauC2tcio", "11", status);
#    @test isapprox(rc2t[0][1], 0.9834769806938470149, 1e-12,
#        "iauC2tcio", "12", status);
#    @test isapprox(rc2t[0][2], 0.6555535638685466874e-4, 1e-12,
#        "iauC2tcio", "13", status);

#    @test isapprox(rc2t[1][0], -0.9834768134135996657, 1e-12,
#        "iauC2tcio", "21", status);
#    @test isapprox(rc2t[1][1], -0.1810332203649448367, 1e-12,
#        "iauC2tcio", "22", status);
#    @test isapprox(rc2t[1][2], 0.5749801116141106528e-3, 1e-12,
#        "iauC2tcio", "23", status);

#    @test isapprox(rc2t[2][0], 0.5773474014081407076e-3, 1e-12,
#        "iauC2tcio", "31", status);
#    @test isapprox(rc2t[2][1], 0.3961832391772658944e-4, 1e-12,
#        "iauC2tcio", "32", status);
#    @test isapprox(rc2t[2][2], 0.9999998325501691969, 1e-12,
#        "iauC2tcio", "33", status);
# end

# let
#    double rbpn[3][3], gst, rpom[3][3], rc2t[3][3];


#    rbpn[0][0] =  0.9999989440476103608;
#    rbpn[0][1] = -0.1332881761240011518e-2;
#    rbpn[0][2] = -0.5790767434730085097e-3;

#    rbpn[1][0] =  0.1332858254308954453e-2;
#    rbpn[1][1] =  0.9999991109044505944;
#    rbpn[1][2] = -0.4097782710401555759e-4;

#    rbpn[2][0] =  0.5791308472168153320e-3;
#    rbpn[2][1] =  0.4020595661593994396e-4;
#    rbpn[2][2] =  0.9999998314954572365;

#    gst = 1.754166138040730516;

#    rpom[0][0] =  0.9999999999999674705;
#    rpom[0][1] = -0.1367174580728847031e-10;
#    rpom[0][2] =  0.2550602379999972723e-6;

#    rpom[1][0] =  0.1414624947957029721e-10;
#    rpom[1][1] =  0.9999999999982694954;
#    rpom[1][2] = -0.1860359246998866338e-5;

#    rpom[2][0] = -0.2550602379741215275e-6;
#    rpom[2][1] =  0.1860359247002413923e-5;
#    rpom[2][2] =  0.9999999999982369658;

#    iauC2teqx(rbpn, gst, rpom, rc2t);

#    @test isapprox(rc2t[0][0], -0.1810332128528685730, 1e-12,
#        "iauC2teqx", "11", status);
#    @test isapprox(rc2t[0][1], 0.9834769806897685071, 1e-12,
#        "iauC2teqx", "12", status);
#    @test isapprox(rc2t[0][2], 0.6555535639982634449e-4, 1e-12,
#        "iauC2teqx", "13", status);

#    @test isapprox(rc2t[1][0], -0.9834768134095211257, 1e-12,
#        "iauC2teqx", "21", status);
#    @test isapprox(rc2t[1][1], -0.1810332203871023800, 1e-12,
#        "iauC2teqx", "22", status);
#    @test isapprox(rc2t[1][2], 0.5749801116126438962e-3, 1e-12,
#        "iauC2teqx", "23", status);

#    @test isapprox(rc2t[2][0], 0.5773474014081539467e-3, 1e-12,
#        "iauC2teqx", "31", status);
#    @test isapprox(rc2t[2][1], 0.3961832391768640871e-4, 1e-12,
#        "iauC2teqx", "32", status);
#    @test isapprox(rc2t[2][2], 0.9999998325501691969, 1e-12,
#        "iauC2teqx", "33", status);
# end

# let
#    double tta, ttb, uta, utb, dpsi, deps, xp, yp, rc2t[3][3];


#    tta = 2400000.5;
#    uta = 2400000.5;
#    ttb = 53736.0;
#    utb = 53736.0;
#    deps =  0.4090789763356509900;
#    dpsi = -0.9630909107115582393e-5;
#    xp = 2.55060238e-7;
#    yp = 1.860359247e-6;

#    iauC2tpe(tta, ttb, uta, utb, dpsi, deps, xp, yp, rc2t);

#    @test isapprox(rc2t[0][0], -0.1813677995763029394, 1e-12,
#        "iauC2tpe", "11", status);
#    @test isapprox(rc2t[0][1], 0.9023482206891683275, 1e-12,
#        "iauC2tpe", "12", status);
#    @test isapprox(rc2t[0][2], -0.3909902938641085751, 1e-12,
#        "iauC2tpe", "13", status);

#    @test isapprox(rc2t[1][0], -0.9834147641476804807, 1e-12,
#        "iauC2tpe", "21", status);
#    @test isapprox(rc2t[1][1], -0.1659883635434995121, 1e-12,
#        "iauC2tpe", "22", status);
#    @test isapprox(rc2t[1][2], 0.7309763898042819705e-1, 1e-12,
#        "iauC2tpe", "23", status);

#    @test isapprox(rc2t[2][0], 0.1059685430673215247e-2, 1e-12,
#        "iauC2tpe", "31", status);
#    @test isapprox(rc2t[2][1], 0.3977631855605078674, 1e-12,
#        "iauC2tpe", "32", status);
#    @test isapprox(rc2t[2][2], 0.9174875068792735362, 1e-12,
#        "iauC2tpe", "33", status);
# end

# let
#    double tta, ttb, uta, utb, x, y, xp, yp, rc2t[3][3];


#    tta = 2400000.5;
#    uta = 2400000.5;
#    ttb = 53736.0;
#    utb = 53736.0;
#    x = 0.5791308486706011000e-3;
#    y = 0.4020579816732961219e-4;
#    xp = 2.55060238e-7;
#    yp = 1.860359247e-6;

#    iauC2txy(tta, ttb, uta, utb, x, y, xp, yp, rc2t);

#    @test isapprox(rc2t[0][0], -0.1810332128306279253, 1e-12,
#        "iauC2txy", "11", status);
#    @test isapprox(rc2t[0][1], 0.9834769806938520084, 1e-12,
#        "iauC2txy", "12", status);
#    @test isapprox(rc2t[0][2], 0.6555551248057665829e-4, 1e-12,
#        "iauC2txy", "13", status);

#    @test isapprox(rc2t[1][0], -0.9834768134136142314, 1e-12,
#        "iauC2txy", "21", status);
#    @test isapprox(rc2t[1][1], -0.1810332203649529312, 1e-12,
#        "iauC2txy", "22", status);
#    @test isapprox(rc2t[1][2], 0.5749800843594139912e-3, 1e-12,
#        "iauC2txy", "23", status);

#    @test isapprox(rc2t[2][0], 0.5773474028619264494e-3, 1e-12,
#        "iauC2txy", "31", status);
#    @test isapprox(rc2t[2][1], 0.3961816546911624260e-4, 1e-12,
#        "iauC2txy", "32", status);
#    @test isapprox(rc2t[2][2], 0.9999998325501746670, 1e-12,
#        "iauC2txy", "33", status);
# end

# let
#    int j;
#    double djm0, djm;


#    j = iauCal2jd(2003, 06, 01, &djm0, &djm);

#    @test isapprox(djm0, 2400000.5, 0.0, "iauCal2jd", "djm0", status);
#    @test isapprox(djm,    52791.0, 0.0, "iauCal2jd", "djm", status);

#    viv(j, 0, "iauCal2jd", "j", status);
# end

# let
#    double p[3], c[3];


#    p[0] =  0.3;
#    p[1] =  1.2;
#    p[2] = -2.5;

#    iauCp(p, c);

#    @test isapprox(c[0],  0.3, 0.0, "iauCp", "1", status);
#    @test isapprox(c[1],  1.2, 0.0, "iauCp", "2", status);
#    @test isapprox(c[2], -2.5, 0.0, "iauCp", "3", status);
#end

# let
#    double pv[2][3], c[2][3];


#    pv[0][0] =  0.3;
#    pv[0][1] =  1.2;
#    pv[0][2] = -2.5;

#    pv[1][0] = -0.5;
#    pv[1][1] =  3.1;
#    pv[1][2] =  0.9;

#    iauCpv(pv, c);

#    @test isapprox(c[0][0],  0.3, 0.0, "iauCpv", "p1", status);
#    @test isapprox(c[0][1],  1.2, 0.0, "iauCpv", "p2", status);
#    @test isapprox(c[0][2], -2.5, 0.0, "iauCpv", "p3", status);

#    @test isapprox(c[1][0], -0.5, 0.0, "iauCpv", "v1", status);
#    @test isapprox(c[1][1],  3.1, 0.0, "iauCpv", "v2", status);
#    @test isapprox(c[1][2],  0.9, 0.0, "iauCpv", "v3", status);
# end

# let
#    double r[3][3], c[3][3];


#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    iauCr(r, c);

#    @test isapprox(c[0][0], 2.0, 0.0, "iauCr", "11", status);
#    @test isapprox(c[0][1], 3.0, 0.0, "iauCr", "12", status);
#    @test isapprox(c[0][2], 2.0, 0.0, "iauCr", "13", status);

#    @test isapprox(c[1][0], 3.0, 0.0, "iauCr", "21", status);
#    @test isapprox(c[1][1], 2.0, 0.0, "iauCr", "22", status);
#    @test isapprox(c[1][2], 3.0, 0.0, "iauCr", "23", status);

#    @test isapprox(c[2][0], 3.0, 0.0, "iauCr", "31", status);
#    @test isapprox(c[2][1], 4.0, 0.0, "iauCr", "32", status);
#    @test isapprox(c[2][2], 5.0, 0.0, "iauCr", "33", status);
#end

# let
#    int j, iy, im, id, ihmsf[4];


#    j = iauD2dtf("UTC", 5, 2400000.5, 49533.99999, &iy, &im, &id, ihmsf);

#    viv(iy, 1994, "iauD2dtf", "y", status);
#    viv(im, 6, "iauD2dtf", "mo", status);
#    viv(id, 30, "iauD2dtf", "d", status);
#    viv(ihmsf[0], 23, "iauD2dtf", "h", status);
#    viv(ihmsf[1], 59, "iauD2dtf", "m", status);
#    viv(ihmsf[2], 60, "iauD2dtf", "s", status);
#    viv(ihmsf[3], 13599, "iauD2dtf", "f", status);
#    viv(j, 0, "iauD2dtf", "j", status);
# end

# let
#    int ihmsf[4];
#    char s;


#    iauD2tf(4, -0.987654321, &s, ihmsf);

#    viv((int)s, '-', "iauD2tf", "s", status);

#    viv(ihmsf[0], 23, "iauD2tf", "0", status);
#    viv(ihmsf[1], 42, "iauD2tf", "1", status);
#    viv(ihmsf[2], 13, "iauD2tf", "2", status);
#    viv(ihmsf[3], 3333, "iauD2tf", "3", status);
# end

# let
#    int j;
#    double deltat;


#    j = iauDat(2003, 6, 1, 0.0, &deltat);

#    @test isapprox(deltat, 32.0, 0.0, "iauDat", "d1", status);
#    viv(j, 0, "iauDat", "j1", status);

#    j = iauDat(2008, 1, 17, 0.0, &deltat);

#    @test isapprox(deltat, 33.0, 0.0, "iauDat", "d2", status);
#    viv(j, 0, "iauDat", "j2", status);

#    j = iauDat(2017, 9, 1, 0.0, &deltat);

#    @test isapprox(deltat, 37.0, 0.0, "iauDat", "d3", status);
#    viv(j, 0, "iauDat", "j3", status);
# end

# let
#    double dtdb;


#    dtdb = iauDtdb(2448939.5, 0.123, 0.76543, 5.0123, 5525.242, 3190.0);

#    @test isapprox(dtdb, -0.1280368005936998991e-2, 1e-15, "iauDtdb", "", status);
# end

# let
#    double u1, u2;
#    int j;


#    j = iauDtf2d("UTC", 1994, 6, 30, 23, 59, 60.13599, &u1, &u2);

#    @test isapprox(u1+u2, 2449534.49999, 1e-6, "iauDtf2d", "u", status);
#    viv(j, 0, "iauDtf2d", "j", status);
# end

# let
#    double date1, date2, dl, db, dr, dd;


#    date1 = 2456165.5;
#    date2 = 0.401182685;
#    dl = 5.1;
#    db = -0.9;

#    iauEceq06(date1, date2, dl, db, &dr, &dd);

#    @test isapprox(dr, 5.533459733613627767, 1e-14, "iauEceq06", "dr", status);
#    @test isapprox(dd, -1.246542932554480576, 1e-14, "iauEceq06", "dd", status);
# end

# let
#    double date1, date2, rm[3][3];


#    date1 = 2456165.5;
#    date2 = 0.401182685;

#    iauEcm06(date1, date2, rm);

#    @test isapprox(rm[0][0], 0.9999952427708701137, 1e-14,
#        "iauEcm06", "rm11", status);
#    @test isapprox(rm[0][1], -0.2829062057663042347e-2, 1e-14,
#        "iauEcm06", "rm12", status);
#    @test isapprox(rm[0][2], -0.1229163741100017629e-2, 1e-14,
#        "iauEcm06", "rm13", status);
#    @test isapprox(rm[1][0], 0.3084546876908653562e-2, 1e-14,
#        "iauEcm06", "rm21", status);
#    @test isapprox(rm[1][1], 0.9174891871550392514, 1e-14,
#        "iauEcm06", "rm22", status);
#    @test isapprox(rm[1][2], 0.3977487611849338124, 1e-14,
#        "iauEcm06", "rm23", status);
#    @test isapprox(rm[2][0], 0.2488512951527405928e-5, 1e-14,
#        "iauEcm06", "rm31", status);
#    @test isapprox(rm[2][1], -0.3977506604161195467, 1e-14,
#        "iauEcm06", "rm32", status);
#    @test isapprox(rm[2][2], 0.9174935488232863071, 1e-14,
#        "iauEcm06", "rm33", status);
# end

# let
#    double epsa, dpsi, ee;


#    epsa =  0.4090789763356509900;
#    dpsi = -0.9630909107115582393e-5;

#    ee = iauEe00(2400000.5, 53736.0, epsa, dpsi);

#    @test isapprox(ee, -0.8834193235367965479e-5, 1e-18, "iauEe00", "", status);
# end

# let
#    double ee;


#    ee = iauEe00a(2400000.5, 53736.0);

#    @test isapprox(ee, -0.8834192459222588227e-5, 1e-18, "iauEe00a", "", status);
# end

# let
#    double ee;


#    ee = iauEe00b(2400000.5, 53736.0);

#    @test isapprox(ee, -0.8835700060003032831e-5, 1e-18, "iauEe00b", "", status);
# end

# let
#    double ee;


#    ee = iauEe06a(2400000.5, 53736.0);

#    @test isapprox(ee, -0.8834195072043790156e-5, 1e-15, "iauEe06a", "", status);
#end

# let
#    double eect;


#    eect = iauEect00(2400000.5, 53736.0);

#    @test isapprox(eect, 0.2046085004885125264e-8, 1e-20, "iauEect00", "", status);
# end

# let
#    int j;
#    double a, f;

#    j = iauEform(0, &a, &f);

#    viv(j, -1, "iauEform", "j0", status);

#    j = iauEform(WGS84, &a, &f);

#    viv(j, 0, "iauEform", "j1", status);
#    @test isapprox(a, 6378137.0, 1e-10, "iauEform", "a1", status);
#    @test isapprox(f, 0.3352810664747480720e-2, 1e-18, "iauEform", "f1", status);

#    j = iauEform(GRS80, &a, &f);

#    viv(j, 0, "iauEform", "j2", status);
#    @test isapprox(a, 6378137.0, 1e-10, "iauEform", "a2", status);
#    @test isapprox(f, 0.3352810681182318935e-2, 1e-18, "iauEform", "f2", status);

#    j = iauEform(WGS72, &a, &f);

#    viv(j, 0, "iauEform", "j2", status);
#    @test isapprox(a, 6378135.0, 1e-10, "iauEform", "a3", status);
#    @test isapprox(f, 0.3352779454167504862e-2, 1e-18, "iauEform", "f3", status);

#    j = iauEform(4, &a, &f);
#    viv(j, -1, "iauEform", "j3", status);
#end

# let
#    double eo;


#    eo = iauEo06a(2400000.5, 53736.0);

#    @test isapprox(eo, -0.1332882371941833644e-2, 1e-15, "iauEo06a", "", status);
# end

# let
#    double rnpb[3][3], s, eo;


#    rnpb[0][0] =  0.9999989440476103608;
#    rnpb[0][1] = -0.1332881761240011518e-2;
#    rnpb[0][2] = -0.5790767434730085097e-3;

#    rnpb[1][0] =  0.1332858254308954453e-2;
#    rnpb[1][1] =  0.9999991109044505944;
#    rnpb[1][2] = -0.4097782710401555759e-4;

#    rnpb[2][0] =  0.5791308472168153320e-3;
#    rnpb[2][1] =  0.4020595661593994396e-4;
#    rnpb[2][2] =  0.9999998314954572365;

#    s = -0.1220040848472271978e-7;

#    eo = iauEors(rnpb, s);

#    @test isapprox(eo, -0.1332882715130744606e-2, 1e-14, "iauEors", "", status);
# end

# let
#    double epb;


#    epb = iauEpb(2415019.8135, 30103.18648);

#    @test isapprox(epb, 1982.418424159278580, 1e-12, "iauEpb", "", status);
# end

# let
#    double epb, djm0, djm;


#    epb = 1957.3;

#    iauEpb2jd(epb, &djm0, &djm);

#    @test isapprox(djm0, 2400000.5, 1e-9, "iauEpb2jd", "djm0", status);
#    @test isapprox(djm, 35948.1915101513, 1e-9, "iauEpb2jd", "mjd", status);
# end

# let
#    double epj;


#    epj = iauEpj(2451545, -7392.5);

#    @test isapprox(epj, 1979.760438056125941, 1e-12, "iauEpj", "", status);
# end

# let
#    double epj, djm0, djm;


#    epj = 1996.8;

#    iauEpj2jd(epj, &djm0, &djm);

#    @test isapprox(djm0, 2400000.5, 1e-9, "iauEpj2jd", "djm0", status);
#    @test isapprox(djm,    50375.7, 1e-9, "iauEpj2jd", "mjd",  status);
# end

# let
#    double pvh[2][3], pvb[2][3];
#    int j;


#    j = iauEpv00(2400000.5, 53411.52501161, pvh, pvb);

#    @test isapprox(pvh[0][0], -0.7757238809297706813, 1e-14,
#        "iauEpv00", "ph(x)", status);
#    @test isapprox(pvh[0][1], 0.5598052241363340596, 1e-14,
#        "iauEpv00", "ph(y)", status);
#    @test isapprox(pvh[0][2], 0.2426998466481686993, 1e-14,
#        "iauEpv00", "ph(z)", status);

#    @test isapprox(pvh[1][0], -0.1091891824147313846e-1, 1e-15,
#        "iauEpv00", "vh(x)", status);
#    @test isapprox(pvh[1][1], -0.1247187268440845008e-1, 1e-15,
#        "iauEpv00", "vh(y)", status);
#    @test isapprox(pvh[1][2], -0.5407569418065039061e-2, 1e-15,
#        "iauEpv00", "vh(z)", status);

#    @test isapprox(pvb[0][0], -0.7714104440491111971, 1e-14,
#        "iauEpv00", "pb(x)", status);
#    @test isapprox(pvb[0][1], 0.5598412061824171323, 1e-14,
#        "iauEpv00", "pb(y)", status);
#    @test isapprox(pvb[0][2], 0.2425996277722452400, 1e-14,
#        "iauEpv00", "pb(z)", status);

#    @test isapprox(pvb[1][0], -0.1091874268116823295e-1, 1e-15,
#        "iauEpv00", "vb(x)", status);
#    @test isapprox(pvb[1][1], -0.1246525461732861538e-1, 1e-15,
#        "iauEpv00", "vb(y)", status);
#    @test isapprox(pvb[1][2], -0.5404773180966231279e-2, 1e-15,
#        "iauEpv00", "vb(z)", status);

#    viv(j, 0, "iauEpv00", "j", status);
# end

# let
#    double date1, date2, dr, dd, dl, db;


#    date1 = 1234.5;
#    date2 = 2440000.5;
#    dr = 1.234;
#    dd = 0.987;

#    iauEqec06(date1, date2, dr, dd, &dl, &db);

#    @test isapprox(dl, 1.342509918994654619, 1e-14, "iauEqec06", "dl", status);
#    @test isapprox(db, 0.5926215259704608132, 1e-14, "iauEqec06", "db", status);
# end

# let
#    double eqeq;


#    eqeq = iauEqeq94(2400000.5, 41234.0);

#    @test isapprox(eqeq, 0.5357758254609256894e-4, 1e-17, "iauEqeq94", "", status);
# end

# let
#    double era00;


#    era00 = iauEra00(2400000.5, 54388.0);

#    @test isapprox(era00, 0.4022837240028158102, 1e-12, "iauEra00", "", status);
# end

# let
#    @test isapprox(iauFad03(0.80), 1.946709205396925672, 1e-12,
#        "iauFad03", "", status);
#end

# let
#    @test isapprox(iauFae03(0.80), 1.744713738913081846, 1e-12,
#        "iauFae03", "", status);
#end

# let
#    @test isapprox(iauFaf03(0.80), 0.2597711366745499518, 1e-12,
#        "iauFaf03", "", status);
#end

# let
#    @test isapprox(iauFaju03(0.80), 5.275711665202481138, 1e-12,
#        "iauFaju03", "", status);
#end

# let
#    @test isapprox(iauFal03(0.80), 5.132369751108684150, 1e-12,
#        "iauFal03", "", status);
#end

# let
#    @test isapprox(iauFalp03(0.80), 6.226797973505507345, 1e-12,
#       "iauFalp03", "", status);
#end

# let
#    @test isapprox(iauFama03(0.80), 3.275506840277781492, 1e-12,
#        "iauFama03", "", status);
#end

# let
#    @test isapprox(iauFame03(0.80), 5.417338184297289661, 1e-12,
#        "iauFame03", "", status);
#end

# let
#    @test isapprox(iauFane03(0.80), 2.079343830860413523, 1e-12,
#        "iauFane03", "", status);
#end

# let
#    @test isapprox(iauFaom03(0.80), -5.973618440951302183, 1e-12,
#        "iauFaom03", "", status);
#end

# let
#    @test isapprox(iauFapa03(0.80), 0.1950884762240000000e-1, 1e-12,
#        "iauFapa03", "", status);
#end

# let
#    @test isapprox(iauFasa03(0.80), 5.371574539440827046, 1e-12,
#        "iauFasa03", "", status);
#end

# let
#    @test isapprox(iauFaur03(0.80), 5.180636450180413523, 1e-12,
#        "iauFaur03", "", status);
#end

# let
#    @test isapprox(iauFave03(0.80), 3.424900460533758000, 1e-12,
#        "iauFave03", "", status);
#end

# let
#    double r5, d5, dr5, dd5, px5, rv5, rh, dh, drh, ddh, pxh, rvh;


#    r5  =  1.76779433;
#    d5  = -0.2917517103;
#    dr5 = -1.91851572e-7;
#    dd5 = -5.8468475e-6;
#    px5 =  0.379210;
#    rv5 = -7.6;

#    iauFk52h(r5, d5, dr5, dd5, px5, rv5,
#             &rh, &dh, &drh, &ddh, &pxh, &rvh);

#    @test isapprox(rh, 1.767794226299947632, 1e-14,
#        "iauFk52h", "ra", status);
#    @test isapprox(dh,  -0.2917516070530391757, 1e-14,
#        "iauFk52h", "dec", status);
#    @test isapprox(drh, -0.19618741256057224e-6,1e-19,
#        "iauFk52h", "dr5", status);
#    @test isapprox(ddh, -0.58459905176693911e-5, 1e-19,
#        "iauFk52h", "dd5", status);
#    @test isapprox(pxh,  0.37921, 1e-14,
#        "iauFk52h", "px", status);
#    @test isapprox(rvh, -7.6000000940000254, 1e-11,
#        "iauFk52h", "rv", status);
# end

# let
#    double r5h[3][3], s5h[3];


#    iauFk5hip(r5h, s5h);

#    @test isapprox(r5h[0][0], 0.9999999999999928638, 1e-14,
#        "iauFk5hip", "11", status);
#    @test isapprox(r5h[0][1], 0.1110223351022919694e-6, 1e-17,
#        "iauFk5hip", "12", status);
#    @test isapprox(r5h[0][2], 0.4411803962536558154e-7, 1e-17,
#        "iauFk5hip", "13", status);
#    @test isapprox(r5h[1][0], -0.1110223308458746430e-6, 1e-17,
#        "iauFk5hip", "21", status);
#    @test isapprox(r5h[1][1], 0.9999999999999891830, 1e-14,
#        "iauFk5hip", "22", status);
#    @test isapprox(r5h[1][2], -0.9647792498984142358e-7, 1e-17,
#        "iauFk5hip", "23", status);
#    @test isapprox(r5h[2][0], -0.4411805033656962252e-7, 1e-17,
#        "iauFk5hip", "31", status);
#    @test isapprox(r5h[2][1], 0.9647792009175314354e-7, 1e-17,
#        "iauFk5hip", "32", status);
#    @test isapprox(r5h[2][2], 0.9999999999999943728, 1e-14,
#        "iauFk5hip", "33", status);
#    @test isapprox(s5h[0], -0.1454441043328607981e-8, 1e-17,
#        "iauFk5hip", "s1", status);
#    @test isapprox(s5h[1], 0.2908882086657215962e-8, 1e-17,
#        "iauFk5hip", "s2", status);
#    @test isapprox(s5h[2], 0.3393695767766751955e-8, 1e-17,
#        "iauFk5hip", "s3", status);
# end

# let
#    double r5, d5, rh, dh;


#    r5 =  1.76779433;
#    d5 = -0.2917517103;

#    iauFk5hz(r5, d5, 2400000.5, 54479.0, &rh, &dh);

#    @test isapprox(rh,  1.767794191464423978, 1e-12, "iauFk5hz", "ra", status);
#    @test isapprox(dh, -0.2917516001679884419, 1e-12, "iauFk5hz", "dec", status);
# end

# let
#    double gamb, phib, psi, eps, r[3][3];


#    gamb = -0.2243387670997992368e-5;
#    phib =  0.4091014602391312982;
#    psi  = -0.9501954178013015092e-3;
#    eps  =  0.4091014316587367472;

#    iauFw2m(gamb, phib, psi, eps, r);

#    @test isapprox(r[0][0], 0.9999995505176007047, 1e-12,
#        "iauFw2m", "11", status);
#    @test isapprox(r[0][1], 0.8695404617348192957e-3, 1e-12,
#        "iauFw2m", "12", status);
#    @test isapprox(r[0][2], 0.3779735201865582571e-3, 1e-12,
#        "iauFw2m", "13", status);

#    @test isapprox(r[1][0], -0.8695404723772016038e-3, 1e-12,
#        "iauFw2m", "21", status);
#    @test isapprox(r[1][1], 0.9999996219496027161, 1e-12,
#        "iauFw2m", "22", status);
#    @test isapprox(r[1][2], -0.1361752496887100026e-6, 1e-12,
#        "iauFw2m", "23", status);

#    @test isapprox(r[2][0], -0.3779734957034082790e-3, 1e-12,
#        "iauFw2m", "31", status);
#    @test isapprox(r[2][1], -0.1924880848087615651e-6, 1e-12,
#        "iauFw2m", "32", status);
#    @test isapprox(r[2][2], 0.9999999285679971958, 1e-12,
#        "iauFw2m", "33", status);
# end

# let
#    double gamb, phib, psi, eps, x, y;


#    gamb = -0.2243387670997992368e-5;
#    phib =  0.4091014602391312982;
#    psi  = -0.9501954178013015092e-3;
#    eps  =  0.4091014316587367472;

#    iauFw2xy(gamb, phib, psi, eps, &x, &y);

#    @test isapprox(x, -0.3779734957034082790e-3, 1e-14, "iauFw2xy", "x", status);
#    @test isapprox(y, -0.1924880848087615651e-6, 1e-14, "iauFw2xy", "y", status);
# end

# let
#    double dl, db, dr, dd;


#    dl =  5.5850536063818546461558105;
#    db = -0.7853981633974483096156608;
#    iauG2icrs (dl, db, &dr, &dd);
#    @test isapprox(dr,  5.9338074302227188048671, 1e-14, "iauG2icrs", "R", status);
#    @test isapprox(dd, -1.1784870613579944551541, 1e-14, "iauG2icrs", "D", status);
# end

# let
#    int j;
#    double xyz[] = {2e6, 3e6, 5.244eend;
#    double e, p, h;

#    j = iauGc2gd(0, xyz, &e, &p, &h);

#    viv(j, -1, "iauGc2gd", "j0", status);

#    j = iauGc2gd(WGS84, xyz, &e, &p, &h);

#    viv(j, 0, "iauGc2gd", "j1", status);
#    @test isapprox(e, 0.9827937232473290680, 1e-14, "iauGc2gd", "e1", status);
#    @test isapprox(p, 0.97160184819075459, 1e-14, "iauGc2gd", "p1", status);
#    @test isapprox(h, 331.4172461426059892, 1e-8, "iauGc2gd", "h1", status);

#    j = iauGc2gd(GRS80, xyz, &e, &p, &h);

#    viv(j, 0, "iauGc2gd", "j2", status);
#    @test isapprox(e, 0.9827937232473290680, 1e-14, "iauGc2gd", "e2", status);
#    @test isapprox(p, 0.97160184820607853, 1e-14, "iauGc2gd", "p2", status);
#    @test isapprox(h, 331.41731754844348, 1e-8, "iauGc2gd", "h2", status);

#    j = iauGc2gd(WGS72, xyz, &e, &p, &h);

#    viv(j, 0, "iauGc2gd", "j3", status);
#    @test isapprox(e, 0.9827937232473290680, 1e-14, "iauGc2gd", "e3", status);
#    @test isapprox(p, 0.9716018181101511937, 1e-14, "iauGc2gd", "p3", status);
#    @test isapprox(h, 333.2770726130318123, 1e-8, "iauGc2gd", "h3", status);

#    j = iauGc2gd(4, xyz, &e, &p, &h);

#    viv(j, -1, "iauGc2gd", "j4", status);
#end

# let
#    int j;
#    double a = 6378136.0, f = 0.0033528;
#    double xyz[] = {2e6, 3e6, 5.244eend;
#    double e, p, h;

#    j = iauGc2gde(a, f, xyz, &e, &p, &h);

#    viv(j, 0, "iauGc2gde", "j", status);
#    @test isapprox(e, 0.9827937232473290680, 1e-14, "iauGc2gde", "e", status);
#    @test isapprox(p, 0.9716018377570411532, 1e-14, "iauGc2gde", "p", status);
#    @test isapprox(h, 332.36862495764397, 1e-8, "iauGc2gde", "h", status);
#end

# let
#    int j;
#    double e = 3.1, p = -0.5, h = 2500.0;
#    double xyz[3];

#    j = iauGd2gc(0, e, p, h, xyz);

#    viv(j, -1, "iauGd2gc", "j0", status);

#    j = iauGd2gc(WGS84, e, p, h, xyz);

#    viv(j, 0, "iauGd2gc", "j1", status);
#    @test isapprox(xyz[0], -5599000.5577049947, 1e-7, "iauGd2gc", "1/1", status);
#    @test isapprox(xyz[1], 233011.67223479203, 1e-7, "iauGd2gc", "2/1", status);
#    @test isapprox(xyz[2], -3040909.4706983363, 1e-7, "iauGd2gc", "3/1", status);

#    j = iauGd2gc(GRS80, e, p, h, xyz);

#    viv(j, 0, "iauGd2gc", "j2", status);
#    @test isapprox(xyz[0], -5599000.5577260984, 1e-7, "iauGd2gc", "1/2", status);
#    @test isapprox(xyz[1], 233011.6722356702949, 1e-7, "iauGd2gc", "2/2", status);
#    @test isapprox(xyz[2], -3040909.4706095476, 1e-7, "iauGd2gc", "3/2", status);

#    j = iauGd2gc(WGS72, e, p, h, xyz);

#    viv(j, 0, "iauGd2gc", "j3", status);
#    @test isapprox(xyz[0], -5598998.7626301490, 1e-7, "iauGd2gc", "1/3", status);
#    @test isapprox(xyz[1], 233011.5975297822211, 1e-7, "iauGd2gc", "2/3", status);
#    @test isapprox(xyz[2], -3040908.6861467111, 1e-7, "iauGd2gc", "3/3", status);

#    j = iauGd2gc(4, e, p, h, xyz);

#    viv(j, -1, "iauGd2gc", "j4", status);
#end

# let
#    int j;
#    double a = 6378136.0, f = 0.0033528;
#    double e = 3.1, p = -0.5, h = 2500.0;
#    double xyz[3];

#    j = iauGd2gce(a, f, e, p, h, xyz);

#    viv(j, 0, "iauGd2gce", "j", status);
#    @test isapprox(xyz[0], -5598999.6665116328, 1e-7, "iauGd2gce", "1", status);
#    @test isapprox(xyz[1], 233011.6351463057189, 1e-7, "iauGd2gce", "2", status);
#    @test isapprox(xyz[2], -3040909.0517314132, 1e-7, "iauGd2gce", "3", status);
#end

# let
#    double theta;


#    theta = iauGmst00(2400000.5, 53736.0, 2400000.5, 53736.0);

#    @test isapprox(theta, 1.754174972210740592, 1e-12, "iauGmst00", "", status);
# end

# let
#    double theta;


#    theta = iauGmst06(2400000.5, 53736.0, 2400000.5, 53736.0);

#    @test isapprox(theta, 1.754174971870091203, 1e-12, "iauGmst06", "", status);
# end

# let
#    double theta;


#    theta = iauGmst82(2400000.5, 53736.0);

#    @test isapprox(theta, 1.754174981860675096, 1e-12, "iauGmst82", "", status);
# end

# let
#    double theta;


#    theta = iauGst00a(2400000.5, 53736.0, 2400000.5, 53736.0);

#    @test isapprox(theta, 1.754166138018281369, 1e-12, "iauGst00a", "", status);
# end

# let
#    double theta;


#    theta = iauGst00b(2400000.5, 53736.0);

#    @test isapprox(theta, 1.754166136510680589, 1e-12, "iauGst00b", "", status);
# end

# let
#    double rnpb[3][3], theta;


#    rnpb[0][0] =  0.9999989440476103608;
#    rnpb[0][1] = -0.1332881761240011518e-2;
#    rnpb[0][2] = -0.5790767434730085097e-3;

#    rnpb[1][0] =  0.1332858254308954453e-2;
#    rnpb[1][1] =  0.9999991109044505944;
#    rnpb[1][2] = -0.4097782710401555759e-4;

#    rnpb[2][0] =  0.5791308472168153320e-3;
#    rnpb[2][1] =  0.4020595661593994396e-4;
#    rnpb[2][2] =  0.9999998314954572365;

#    theta = iauGst06(2400000.5, 53736.0, 2400000.5, 53736.0, rnpb);

#    @test isapprox(theta, 1.754166138018167568, 1e-12, "iauGst06", "", status);
# end

# let
#    double theta;


#    theta = iauGst06a(2400000.5, 53736.0, 2400000.5, 53736.0);

#    @test isapprox(theta, 1.754166137675019159, 1e-12, "iauGst06a", "", status);
# end

# let
#    double theta;


#    theta = iauGst94(2400000.5, 53736.0);

#    @test isapprox(theta, 1.754166136020645203, 1e-12, "iauGst94", "", status);
# end

# let
#    double dr, dd, dl, db;

#    dr =  5.9338074302227188048671087;
#    dd = -1.1784870613579944551540570;
#    iauIcrs2g (dr, dd, &dl, &db);
#    @test isapprox(dl,  5.5850536063818546461558, 1e-14, "iauIcrs2g", "L", status);
#    @test isapprox(db, -0.7853981633974483096157, 1e-14, "iauIcrs2g", "B", status);
# end

# let
#    double rh, dh, drh, ddh, pxh, rvh, r5, d5, dr5, dd5, px5, rv5;


#    rh  =  1.767794352;
#    dh  = -0.2917512594;
#    drh = -2.76413026e-6;
#    ddh = -5.92994449e-6;
#    pxh =  0.379210;
#    rvh = -7.6;

#    iauH2fk5(rh, dh, drh, ddh, pxh, rvh,
#             &r5, &d5, &dr5, &dd5, &px5, &rv5);

#    @test isapprox(r5, 1.767794455700065506, 1e-13,
#        "iauH2fk5", "ra", status);
#    @test isapprox(d5, -0.2917513626469638890, 1e-13,
#        "iauH2fk5", "dec", status);
#    @test isapprox(dr5, -0.27597945024511204e-5, 1e-18,
#        "iauH2fk5", "dr5", status);
#    @test isapprox(dd5, -0.59308014093262838e-5, 1e-18,
#        "iauH2fk5", "dd5", status);
#    @test isapprox(px5, 0.37921, 1e-13,
#        "iauH2fk5", "px", status);
#    @test isapprox(rv5, -7.6000001309071126, 1e-11,
#        "iauH2fk5", "rv", status);
# end

# let
#    double h, d, p, a, e;


#    h = 1.1;
#    d = 1.2;
#    p = 0.3;

#    iauHd2ae(h, d, p, &a, &e);

#    @test isapprox(a, 5.916889243730066194, 1e-13, "iauHd2ae", "a", status);
#    @test isapprox(e, 0.4472186304990486228, 1e-14, "iauHd2ae", "e", status);
# end

# let
#    double h, d, p, q;


#    h = 1.1;
#    d = 1.2;
#    p = 0.3;

#    q = iauHd2pa(h, d, p);

#    @test isapprox(q, 1.906227428001995580, 1e-13, "iauHd2pa", "q", status);
# end

# let
#    double rh, dh, r5, d5, dr5, dd5;



#    rh =  1.767794352;
#    dh = -0.2917512594;

#    iauHfk5z(rh, dh, 2400000.5, 54479.0, &r5, &d5, &dr5, &dd5);

#    @test isapprox(r5, 1.767794490535581026, 1e-13,
#        "iauHfk5z", "ra", status);
#    @test isapprox(d5, -0.2917513695320114258, 1e-14,
#        "iauHfk5z", "dec", status);
#    @test isapprox(dr5, 0.4335890983539243029e-8, 1e-22,
#        "iauHfk5z", "dr5", status);
#    @test isapprox(dd5, -0.8569648841237745902e-9, 1e-23,
#        "iauHfk5z", "dd5", status);
# end

# let
#    double r[3][3];


#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    iauIr(r);

#    @test isapprox(r[0][0], 1.0, 0.0, "iauIr", "11", status);
#    @test isapprox(r[0][1], 0.0, 0.0, "iauIr", "12", status);
#    @test isapprox(r[0][2], 0.0, 0.0, "iauIr", "13", status);

#    @test isapprox(r[1][0], 0.0, 0.0, "iauIr", "21", status);
#    @test isapprox(r[1][1], 1.0, 0.0, "iauIr", "22", status);
#    @test isapprox(r[1][2], 0.0, 0.0, "iauIr", "23", status);

#    @test isapprox(r[2][0], 0.0, 0.0, "iauIr", "31", status);
#    @test isapprox(r[2][1], 0.0, 0.0, "iauIr", "32", status);
#    @test isapprox(r[2][2], 1.0, 0.0, "iauIr", "33", status);
# end

# let
#    double dj1, dj2, fd;
#    int iy, im, id, j;


#    dj1 = 2400000.5;
#    dj2 = 50123.9999;

#    j = iauJd2cal(dj1, dj2, &iy, &im, &id, &fd);

#    viv(iy, 1996, "iauJd2cal", "y", status);
#    viv(im, 2, "iauJd2cal", "m", status);
#    viv(id, 10, "iauJd2cal", "d", status);
#    @test isapprox(fd, 0.9999, 1e-7, "iauJd2cal", "fd", status);
#    viv(j, 0, "iauJd2cal", "j", status);
# end

# let
#    double dj1, dj2;
#    int iydmf[4], j;


#    dj1 = 2400000.5;
#    dj2 = 50123.9999;

#    j = iauJdcalf(4, dj1, dj2, iydmf);

#    viv(iydmf[0], 1996, "iauJdcalf", "y", status);
#    viv(iydmf[1], 2, "iauJdcalf", "m", status);
#    viv(iydmf[2], 10, "iauJdcalf", "d", status);
#    viv(iydmf[3], 9999, "iauJdcalf", "f", status);

#    viv(j, 0, "iauJdcalf", "j", status);
# end

# let
# {
#    double bm, p[3], q[3], e[3], em, dlim, p1[3];


#    bm = 0.00028574;
#    p[0] = -0.763276255;
#    p[1] = -0.608633767;
#    p[2] = -0.216735543;
#    q[0] = -0.763276255;
#    q[1] = -0.608633767;
#    q[2] = -0.216735543;
#    e[0] = 0.76700421;
#    e[1] = 0.605629598;
#    e[2] = 0.211937094;
#    em = 8.91276983;
#    dlim = 3e-10;

#    iauLd(bm, p, q, e, em, dlim, p1);

#    @test isapprox(p1[0], -0.7632762548968159627, 1e-12,
#                "iauLd", "1", status);
#    @test isapprox(p1[1], -0.6086337670823762701, 1e-12,
#                "iauLd", "2", status);
#    @test isapprox(p1[2], -0.2167355431320546947, 1e-12,
#                "iauLd", "3", status);
# end

# let
#    int n;
#    iauLDBODY b[3];
#    double ob[3], sc[3], sn[3];


#    n = 3;
#    b[0].bm = 0.00028574;
#    b[0].dl = 3e-10;
#    b[0].pv[0][0] = -7.81014427;
#    b[0].pv[0][1] = -5.60956681;
#    b[0].pv[0][2] = -1.98079819;
#    b[0].pv[1][0] =  0.0030723249;
#    b[0].pv[1][1] = -0.00406995477;
#    b[0].pv[1][2] = -0.00181335842;
#    b[1].bm = 0.00095435;
#    b[1].dl = 3e-9;
#    b[1].pv[0][0] =  0.738098796;
#    b[1].pv[0][1] =  4.63658692;
#    b[1].pv[0][2] =  1.9693136;
#    b[1].pv[1][0] = -0.00755816922;
#    b[1].pv[1][1] =  0.00126913722;
#    b[1].pv[1][2] =  0.000727999001;
#    b[2].bm = 1.0;
#    b[2].dl = 6e-6;
#    b[2].pv[0][0] = -0.000712174377;
#    b[2].pv[0][1] = -0.00230478303;
#    b[2].pv[0][2] = -0.00105865966;
#    b[2].pv[1][0] =  6.29235213e-6;
#    b[2].pv[1][1] = -3.30888387e-7;
#    b[2].pv[1][2] = -2.96486623e-7;
#    ob[0] =  -0.974170437;
#    ob[1] =  -0.2115201;
#    ob[2] =  -0.0917583114;
#    sc[0] =  -0.763276255;
#    sc[1] =  -0.608633767;
#    sc[2] =  -0.216735543;

#    iauLdn(n, b, ob, sc, sn);

#    @test isapprox(sn[0], -0.7632762579693333866, 1e-12,
#                "iauLdn", "1", status);
#    @test isapprox(sn[1], -0.6086337636093002660, 1e-12,
#                "iauLdn", "2", status);
#    @test isapprox(sn[2], -0.2167355420646328159, 1e-12,
#                "iauLdn", "3", status);
# end

# let
#    double p[3], e[3], em, p1[3];


#    p[0] = -0.763276255;
#    p[1] = -0.608633767;
#    p[2] = -0.216735543;
#    e[0] = -0.973644023;
#    e[1] = -0.20925523;
#    e[2] = -0.0907169552;
#    em = 0.999809214;

#    iauLdsun(p, e, em, p1);

#    @test isapprox(p1[0], -0.7632762580731413169, 1e-12,
#                "iauLdsun", "1", status);
#    @test isapprox(p1[1], -0.6086337635262647900, 1e-12,
#                "iauLdsun", "2", status);
#    @test isapprox(p1[2], -0.2167355419322321302, 1e-12,
#                "iauLdsun", "3", status);
# end

# let
#    double epj, dl, db, dr, dd;


#    epj = 2500.0;
#    dl = 1.5;
#    db = 0.6;

#    iauLteceq(epj, dl, db, &dr, &dd);

#    @test isapprox(dr, 1.275156021861921167, 1e-14, "iauLteceq", "dr", status);
#    @test isapprox(dd, 0.9966573543519204791, 1e-14, "iauLteceq", "dd", status);
# end

# let
#    double epj, rm[3][3];


#    epj = -3000.0;

#    iauLtecm(epj, rm);

#    @test isapprox(rm[0][0], 0.3564105644859788825, 1e-14,
#        "iauLtecm", "rm11", status);
#    @test isapprox(rm[0][1], 0.8530575738617682284, 1e-14,
#        "iauLtecm", "rm12", status);
#    @test isapprox(rm[0][2], 0.3811355207795060435, 1e-14,
#        "iauLtecm", "rm13", status);
#    @test isapprox(rm[1][0], -0.9343283469640709942, 1e-14,
#        "iauLtecm", "rm21", status);
#    @test isapprox(rm[1][1], 0.3247830597681745976, 1e-14,
#        "iauLtecm", "rm22", status);
#    @test isapprox(rm[1][2], 0.1467872751535940865, 1e-14,
#        "iauLtecm", "rm23", status);
#    @test isapprox(rm[2][0], 0.1431636191201167793e-2, 1e-14,
#        "iauLtecm", "rm31", status);
#    @test isapprox(rm[2][1], -0.4084222566960599342, 1e-14,
#        "iauLtecm", "rm32", status);
#    @test isapprox(rm[2][2], 0.9127919865189030899, 1e-14,
#        "iauLtecm", "rm33", status);
# end

# let
#    double epj, dr, dd, dl, db;


#    epj = -1500.0;
#    dr = 1.234;
#    dd = 0.987;

#    iauLteqec(epj, dr, dd, &dl, &db);

#    @test isapprox(dl, 0.5039483649047114859, 1e-14, "iauLteqec", "dl", status);
#    @test isapprox(db, 0.5848534459726224882, 1e-14, "iauLteqec", "db", status);
# end

# let
#    double epj, rp[3][3];


#    epj = 1666.666;

#    iauLtp(epj, rp);

#    @test isapprox(rp[0][0], 0.9967044141159213819, 1e-14,
#        "iauLtp", "rp11", status);
#    @test isapprox(rp[0][1], 0.7437801893193210840e-1, 1e-14,
#        "iauLtp", "rp12", status);
#    @test isapprox(rp[0][2], 0.3237624409345603401e-1, 1e-14,
#        "iauLtp", "rp13", status);
#    @test isapprox(rp[1][0], -0.7437802731819618167e-1, 1e-14,
#        "iauLtp", "rp21", status);
#    @test isapprox(rp[1][1], 0.9972293894454533070, 1e-14,
#        "iauLtp", "rp22", status);
#    @test isapprox(rp[1][2], -0.1205768842723593346e-2, 1e-14,
#        "iauLtp", "rp23", status);
#    @test isapprox(rp[2][0], -0.3237622482766575399e-1, 1e-14,
#        "iauLtp", "rp31", status);
#    @test isapprox(rp[2][1], -0.1206286039697609008e-2, 1e-14,
#        "iauLtp", "rp32", status);
#    @test isapprox(rp[2][2], 0.9994750246704010914, 1e-14,
#        "iauLtp", "rp33", status);
# end

# let
#    double epj, rpb[3][3];


#    epj = 1666.666;

#    iauLtpb(epj, rpb);

#    @test isapprox(rpb[0][0], 0.9967044167723271851, 1e-14,
#        "iauLtpb", "rpb11", status);
#    @test isapprox(rpb[0][1], 0.7437794731203340345e-1, 1e-14,
#        "iauLtpb", "rpb12", status);
#    @test isapprox(rpb[0][2], 0.3237632684841625547e-1, 1e-14,
#        "iauLtpb", "rpb13", status);
#    @test isapprox(rpb[1][0], -0.7437795663437177152e-1, 1e-14,
#        "iauLtpb", "rpb21", status);
#    @test isapprox(rpb[1][1], 0.9972293947500013666, 1e-14,
#        "iauLtpb", "rpb22", status);
#    @test isapprox(rpb[1][2], -0.1205741865911243235e-2, 1e-14,
#        "iauLtpb", "rpb23", status);
#    @test isapprox(rpb[2][0], -0.3237630543224664992e-1, 1e-14,
#        "iauLtpb", "rpb31", status);
#    @test isapprox(rpb[2][1], -0.1206316791076485295e-2, 1e-14,
#        "iauLtpb", "rpb32", status);
#    @test isapprox(rpb[2][2], 0.9994750220222438819, 1e-14,
#        "iauLtpb", "rpb33", status);
# end

# let
#    double epj, vec[3];


#    epj = -1500.0;

#    iauLtpecl(epj, vec);

#    @test isapprox(vec[0], 0.4768625676477096525e-3, 1e-14,
#        "iauLtpecl", "vec1", status);
#    @test isapprox(vec[1], -0.4052259533091875112, 1e-14,
#        "iauLtpecl", "vec2", status);
#    @test isapprox(vec[2], 0.9142164401096448012, 1e-14,
#        "iauLtpecl", "vec3", status);
# end

# let
#    double epj, veq[3];


#    epj = -2500.0;

#    iauLtpequ(epj, veq);

#    @test isapprox(veq[0], -0.3586652560237326659, 1e-14,
#        "iauLtpequ", "veq1", status);
#    @test isapprox(veq[1], -0.1996978910771128475, 1e-14,
#        "iauLtpequ", "veq2", status);
#    @test isapprox(veq[2], 0.9118552442250819624, 1e-14,
#        "iauLtpequ", "veq3", status);
# end

# let
#    double rmatn[3][3];


#    iauNum00a(2400000.5, 53736.0, rmatn);

#    @test isapprox(rmatn[0][0], 0.9999999999536227949, 1e-12,
#        "iauNum00a", "11", status);
#    @test isapprox(rmatn[0][1], 0.8836238544090873336e-5, 1e-12,
#        "iauNum00a", "12", status);
#    @test isapprox(rmatn[0][2], 0.3830835237722400669e-5, 1e-12,
#        "iauNum00a", "13", status);

#    @test isapprox(rmatn[1][0], -0.8836082880798569274e-5, 1e-12,
#        "iauNum00a", "21", status);
#    @test isapprox(rmatn[1][1], 0.9999999991354655028, 1e-12,
#        "iauNum00a", "22", status);
#    @test isapprox(rmatn[1][2], -0.4063240865362499850e-4, 1e-12,
#        "iauNum00a", "23", status);

#    @test isapprox(rmatn[2][0], -0.3831194272065995866e-5, 1e-12,
#        "iauNum00a", "31", status);
#    @test isapprox(rmatn[2][1], 0.4063237480216291775e-4, 1e-12,
#        "iauNum00a", "32", status);
#    @test isapprox(rmatn[2][2], 0.9999999991671660338, 1e-12,
#        "iauNum00a", "33", status);
# end

# let
#     double rmatn[3][3];

#     iauNum00b(2400000.5, 53736, rmatn);

#    @test isapprox(rmatn[0][0], 0.9999999999536069682, 1e-12,
#        "iauNum00b", "11", status);
#    @test isapprox(rmatn[0][1], 0.8837746144871248011e-5, 1e-12,
#        "iauNum00b", "12", status);
#    @test isapprox(rmatn[0][2], 0.3831488838252202945e-5, 1e-12,
#        "iauNum00b", "13", status);

#    @test isapprox(rmatn[1][0], -0.8837590456632304720e-5, 1e-12,
#        "iauNum00b", "21", status);
#    @test isapprox(rmatn[1][1], 0.9999999991354692733, 1e-12,
#        "iauNum00b", "22", status);
#    @test isapprox(rmatn[1][2], -0.4063198798559591654e-4, 1e-12,
#        "iauNum00b", "23", status);

#    @test isapprox(rmatn[2][0], -0.3831847930134941271e-5, 1e-12,
#        "iauNum00b", "31", status);
#    @test isapprox(rmatn[2][1], 0.4063195412258168380e-4, 1e-12,
#        "iauNum00b", "32", status);
#    @test isapprox(rmatn[2][2], 0.9999999991671806225, 1e-12,
#        "iauNum00b", "33", status);
# end

# let
#     double rmatn[3][3];

#     iauNum06a(2400000.5, 53736, rmatn);

#    @test isapprox(rmatn[0][0], 0.9999999999536227668, 1e-12,
#        "iauNum06a", "11", status);
#    @test isapprox(rmatn[0][1], 0.8836241998111535233e-5, 1e-12,
#        "iauNum06a", "12", status);
#    @test isapprox(rmatn[0][2], 0.3830834608415287707e-5, 1e-12,
#        "iauNum06a", "13", status);

#    @test isapprox(rmatn[1][0], -0.8836086334870740138e-5, 1e-12,
#        "iauNum06a", "21", status);
#    @test isapprox(rmatn[1][1], 0.9999999991354657474, 1e-12,
#        "iauNum06a", "22", status);
#    @test isapprox(rmatn[1][2], -0.4063240188248455065e-4, 1e-12,
#        "iauNum06a", "23", status);

#    @test isapprox(rmatn[2][0], -0.3831193642839398128e-5, 1e-12,
#        "iauNum06a", "31", status);
#    @test isapprox(rmatn[2][1], 0.4063236803101479770e-4, 1e-12,
#        "iauNum06a", "32", status);
#    @test isapprox(rmatn[2][2], 0.9999999991671663114, 1e-12,
#        "iauNum06a", "33", status);
# end

# let
#    double epsa, dpsi, deps, rmatn[3][3];


#    epsa =  0.4090789763356509900;
#    dpsi = -0.9630909107115582393e-5;
#    deps =  0.4063239174001678826e-4;

#    iauNumat(epsa, dpsi, deps, rmatn);

#    @test isapprox(rmatn[0][0], 0.9999999999536227949, 1e-12,
#        "iauNumat", "11", status);
#    @test isapprox(rmatn[0][1], 0.8836239320236250577e-5, 1e-12,
#        "iauNumat", "12", status);
#    @test isapprox(rmatn[0][2], 0.3830833447458251908e-5, 1e-12,
#        "iauNumat", "13", status);

#    @test isapprox(rmatn[1][0], -0.8836083657016688588e-5, 1e-12,
#        "iauNumat", "21", status);
#    @test isapprox(rmatn[1][1], 0.9999999991354654959, 1e-12,
#        "iauNumat", "22", status);
#    @test isapprox(rmatn[1][2], -0.4063240865361857698e-4, 1e-12,
#        "iauNumat", "23", status);

#    @test isapprox(rmatn[2][0], -0.3831192481833385226e-5, 1e-12,
#        "iauNumat", "31", status);
#    @test isapprox(rmatn[2][1], 0.4063237480216934159e-4, 1e-12,
#        "iauNumat", "32", status);
#    @test isapprox(rmatn[2][2], 0.9999999991671660407, 1e-12,
#        "iauNumat", "33", status);
# end

# let
#    double dpsi, deps;


#    iauNut00a(2400000.5, 53736.0, &dpsi, &deps);

#    @test isapprox(dpsi, -0.9630909107115518431e-5, 1e-13,
#        "iauNut00a", "dpsi", status);
#    @test isapprox(deps,  0.4063239174001678710e-4, 1e-13,
#        "iauNut00a", "deps", status);
# end

# let
#    double dpsi, deps;


#    iauNut00b(2400000.5, 53736.0, &dpsi, &deps);

#    @test isapprox(dpsi, -0.9632552291148362783e-5, 1e-13,
#        "iauNut00b", "dpsi", status);
#    @test isapprox(deps,  0.4063197106621159367e-4, 1e-13,
#        "iauNut00b", "deps", status);
# end

# let
#    double dpsi, deps;


#    iauNut06a(2400000.5, 53736.0, &dpsi, &deps);

#    @test isapprox(dpsi, -0.9630912025820308797e-5, 1e-13,
#        "iauNut06a", "dpsi", status);
#    @test isapprox(deps,  0.4063238496887249798e-4, 1e-13,
#        "iauNut06a", "deps", status);
# end

# let
#    double dpsi, deps;


#    iauNut80(2400000.5, 53736.0, &dpsi, &deps);

#    @test isapprox(dpsi, -0.9643658353226563966e-5, 1e-13,
#        "iauNut80", "dpsi", status);
#    @test isapprox(deps,  0.4060051006879713322e-4, 1e-13,
#        "iauNut80", "deps", status);
# end

# let
#    double rmatn[3][3];


#    iauNutm80(2400000.5, 53736.0, rmatn);

#    @test isapprox(rmatn[0][0], 0.9999999999534999268, 1e-12,
#       "iauNutm80", "11", status);
#    @test isapprox(rmatn[0][1], 0.8847935789636432161e-5, 1e-12,
#       "iauNutm80", "12", status);
#    @test isapprox(rmatn[0][2], 0.3835906502164019142e-5, 1e-12,
#       "iauNutm80", "13", status);

#    @test isapprox(rmatn[1][0], -0.8847780042583435924e-5, 1e-12,
#       "iauNutm80", "21", status);
#    @test isapprox(rmatn[1][1], 0.9999999991366569963, 1e-12,
#       "iauNutm80", "22", status);
#    @test isapprox(rmatn[1][2], -0.4060052702727130809e-4, 1e-12,
#       "iauNutm80", "23", status);

#    @test isapprox(rmatn[2][0], -0.3836265729708478796e-5, 1e-12,
#       "iauNutm80", "31", status);
#    @test isapprox(rmatn[2][1], 0.4060049308612638555e-4, 1e-12,
#       "iauNutm80", "32", status);
#    @test isapprox(rmatn[2][2], 0.9999999991684415129, 1e-12,
#       "iauNutm80", "33", status);
# end

# let
#    @test isapprox(iauObl06(2400000.5, 54388.0), 0.4090749229387258204, 1e-14,
#        "iauObl06", "", status);
#end

# let
#    double eps0;


#    eps0 = iauObl80(2400000.5, 54388.0);

#    @test isapprox(eps0, 0.4090751347643816218, 1e-14, "iauObl80", "", status);
# end

# let
#     double eps0, psia, oma, bpa, bqa, pia, bpia,
#            epsa, chia, za, zetaa, thetaa, pa, gam, phi, psi;


#    iauP06e(2400000.5, 52541.0, &eps0, &psia, &oma, &bpa,
#            &bqa, &pia, &bpia, &epsa, &chia, &za,
#            &zetaa, &thetaa, &pa, &gam, &phi, &psi);

#    @test isapprox(eps0, 0.4090926006005828715, 1e-14,
#        "iauP06e", "eps0", status);
#    @test isapprox(psia, 0.6664369630191613431e-3, 1e-14,
#        "iauP06e", "psia", status);
#    @test isapprox(oma , 0.4090925973783255982, 1e-14,
#        "iauP06e", "oma", status);
#    @test isapprox(bpa, 0.5561149371265209445e-6, 1e-14,
#        "iauP06e", "bpa", status);
#    @test isapprox(bqa, -0.6191517193290621270e-5, 1e-14,
#        "iauP06e", "bqa", status);
#    @test isapprox(pia, 0.6216441751884382923e-5, 1e-14,
#        "iauP06e", "pia", status);
#    @test isapprox(bpia, 3.052014180023779882, 1e-14,
#        "iauP06e", "bpia", status);
#    @test isapprox(epsa, 0.4090864054922431688, 1e-14,
#        "iauP06e", "epsa", status);
#    @test isapprox(chia, 0.1387703379530915364e-5, 1e-14,
#        "iauP06e", "chia", status);
#    @test isapprox(za, 0.2921789846651790546e-3, 1e-14,
#        "iauP06e", "za", status);
#    @test isapprox(zetaa, 0.3178773290332009310e-3, 1e-14,
#        "iauP06e", "zetaa", status);
#    @test isapprox(thetaa, 0.2650932701657497181e-3, 1e-14,
#        "iauP06e", "thetaa", status);
#    @test isapprox(pa, 0.6651637681381016344e-3, 1e-14,
#        "iauP06e", "pa", status);
#    @test isapprox(gam, 0.1398077115963754987e-5, 1e-14,
#        "iauP06e", "gam", status);
#    @test isapprox(phi, 0.4090864090837462602, 1e-14,
#        "iauP06e", "phi", status);
#    @test isapprox(psi, 0.6664464807480920325e-3, 1e-14,
#        "iauP06e", "psi", status);
# end

# let
#    double p[3], pv[2][3];


#    p[0] = 0.25;
#    p[1] = 1.2;
#    p[2] = 3.0;

#    pv[0][0] =  0.3;
#    pv[0][1] =  1.2;
#    pv[0][2] = -2.5;

#    pv[1][0] = -0.5;
#    pv[1][1] =  3.1;
#    pv[1][2] =  0.9;

#    iauP2pv(p, pv);

#    @test isapprox(pv[0][0], 0.25, 0.0, "iauP2pv", "p1", status);
#    @test isapprox(pv[0][1], 1.2,  0.0, "iauP2pv", "p2", status);
#    @test isapprox(pv[0][2], 3.0,  0.0, "iauP2pv", "p3", status);

#    @test isapprox(pv[1][0], 0.0,  0.0, "iauP2pv", "v1", status);
#    @test isapprox(pv[1][1], 0.0,  0.0, "iauP2pv", "v2", status);
#    @test isapprox(pv[1][2], 0.0,  0.0, "iauP2pv", "v3", status);
# end

# let
#    double p[3], theta, phi, r;


#    p[0] = 100.0;
#    p[1] = -50.0;
#    p[2] =  25.0;

#    iauP2s(p, &theta, &phi, &r);

#    @test isapprox(theta, -0.4636476090008061162, 1e-12, "iauP2s", "theta", status);
#    @test isapprox(phi, 0.2199879773954594463, 1e-12, "iauP2s", "phi", status);
#    @test isapprox(r, 114.5643923738960002, 1e-9, "iauP2s", "r", status);
# end

# let
#    double a[3], b[3], theta;


#    a[0] =  1.0;
#    a[1] =  0.1;
#    a[2] =  0.2;

#    b[0] = -3.0;
#    b[1] = 1e-3;
#    b[2] =  0.2;

#    theta = iauPap(a, b);

#    @test isapprox(theta, 0.3671514267841113674, 1e-12, "iauPap", "", status);
# end

# let
#    double al, ap, bl, bp, theta;


#    al =  1.0;
#    ap =  0.1;
#    bl =  0.2;
#    bp = -1.0;

#    theta = iauPas(al, ap, bl, bp);

#    @test isapprox(theta, -2.724544922932270424, 1e-12, "iauPas", "", status);
# end

# let
#    double bzeta, bz, btheta;


#    iauPb06(2400000.5, 50123.9999, &bzeta, &bz, &btheta);

#    @test isapprox(bzeta, -0.5092634016326478238e-3, 1e-12,
#        "iauPb06", "bzeta", status);
#    @test isapprox(bz, -0.3602772060566044413e-3, 1e-12,
#        "iauPb06", "bz", status);
#    @test isapprox(btheta, -0.3779735537167811177e-3, 1e-12,
#        "iauPb06", "btheta", status);
# end

# let
#    double a[3], b[3], adb;


#    a[0] = 2.0;
#    a[1] = 2.0;
#    a[2] = 3.0;

#    b[0] = 1.0;
#    b[1] = 3.0;
#    b[2] = 4.0;

#    adb = iauPdp(a, b);

#    @test isapprox(adb, 20, 1e-12, "iauPdp", "", status);
# end

# let
#    double gamb, phib, psib, epsa;


#    iauPfw06(2400000.5, 50123.9999, &gamb, &phib, &psib, &epsa);

#    @test isapprox(gamb, -0.2243387670997995690e-5, 1e-16,
#        "iauPfw06", "gamb", status);
#    @test isapprox(phib,  0.4091014602391312808, 1e-12,
#        "iauPfw06", "phib", status);
#    @test isapprox(psib, -0.9501954178013031895e-3, 1e-14,
#        "iauPfw06", "psib", status);
#    @test isapprox(epsa,  0.4091014316587367491, 1e-12,
#        "iauPfw06", "epsa", status);
# end

# let
#    double pv[2][3];
#    int j;


#    j = iauPlan94(2400000.5, 1e6, 0, pv);

#    @test isapprox(pv[0][0], 0.0, 0.0, "iauPlan94", "x 1", status);
#    @test isapprox(pv[0][1], 0.0, 0.0, "iauPlan94", "y 1", status);
#    @test isapprox(pv[0][2], 0.0, 0.0, "iauPlan94", "z 1", status);

#    @test isapprox(pv[1][0], 0.0, 0.0, "iauPlan94", "xd 1", status);
#    @test isapprox(pv[1][1], 0.0, 0.0, "iauPlan94", "yd 1", status);
#    @test isapprox(pv[1][2], 0.0, 0.0, "iauPlan94", "zd 1", status);

#    viv(j, -1, "iauPlan94", "j 1", status);

#    j = iauPlan94(2400000.5, 1e6, 10, pv);

#    viv(j, -1, "iauPlan94", "j 2", status);

#    j = iauPlan94(2400000.5, -320000, 3, pv);

#    @test isapprox(pv[0][0], 0.9308038666832975759, 1e-11,
#        "iauPlan94", "x 3", status);
#    @test isapprox(pv[0][1], 0.3258319040261346000, 1e-11,
#        "iauPlan94", "y 3", status);
#    @test isapprox(pv[0][2], 0.1422794544481140560, 1e-11,
#        "iauPlan94", "z 3", status);

#    @test isapprox(pv[1][0], -0.6429458958255170006e-2, 1e-11,
#        "iauPlan94", "xd 3", status);
#    @test isapprox(pv[1][1], 0.1468570657704237764e-1, 1e-11,
#        "iauPlan94", "yd 3", status);
#    @test isapprox(pv[1][2], 0.6406996426270981189e-2, 1e-11,
#        "iauPlan94", "zd 3", status);

#    viv(j, 1, "iauPlan94", "j 3", status);

#    j = iauPlan94(2400000.5, 43999.9, 1, pv);

#    @test isapprox(pv[0][0], 0.2945293959257430832, 1e-11,
#        "iauPlan94", "x 4", status);
#    @test isapprox(pv[0][1], -0.2452204176601049596, 1e-11,
#        "iauPlan94", "y 4", status);
#    @test isapprox(pv[0][2], -0.1615427700571978153, 1e-11,
#        "iauPlan94", "z 4", status);

#    @test isapprox(pv[1][0], 0.1413867871404614441e-1, 1e-11,
#        "iauPlan94", "xd 4", status);
#    @test isapprox(pv[1][1], 0.1946548301104706582e-1, 1e-11,
#        "iauPlan94", "yd 4", status);
#    @test isapprox(pv[1][2], 0.8929809783898904786e-2, 1e-11,
#        "iauPlan94", "zd 4", status);

#    viv(j, 0, "iauPlan94", "j 4", status);
# end

# let
#    double rbp[3][3];


#    iauPmat00(2400000.5, 50123.9999, rbp);

#    @test isapprox(rbp[0][0], 0.9999995505175087260, 1e-12,
#        "iauPmat00", "11", status);
#    @test isapprox(rbp[0][1], 0.8695405883617884705e-3, 1e-14,
#        "iauPmat00", "12", status);
#    @test isapprox(rbp[0][2], 0.3779734722239007105e-3, 1e-14,
#        "iauPmat00", "13", status);

#    @test isapprox(rbp[1][0], -0.8695405990410863719e-3, 1e-14,
#        "iauPmat00", "21", status);
#    @test isapprox(rbp[1][1], 0.9999996219494925900, 1e-12,
#        "iauPmat00", "22", status);
#    @test isapprox(rbp[1][2], -0.1360775820404982209e-6, 1e-14,
#        "iauPmat00", "23", status);

#    @test isapprox(rbp[2][0], -0.3779734476558184991e-3, 1e-14,
#        "iauPmat00", "31", status);
#    @test isapprox(rbp[2][1], -0.1925857585832024058e-6, 1e-14,
#        "iauPmat00", "32", status);
#    @test isapprox(rbp[2][2], 0.9999999285680153377, 1e-12,
#        "iauPmat00", "33", status);
# end

# let
#    double rbp[3][3];


#    iauPmat06(2400000.5, 50123.9999, rbp);

#    @test isapprox(rbp[0][0], 0.9999995505176007047, 1e-12,
#        "iauPmat06", "11", status);
#    @test isapprox(rbp[0][1], 0.8695404617348208406e-3, 1e-14,
#        "iauPmat06", "12", status);
#    @test isapprox(rbp[0][2], 0.3779735201865589104e-3, 1e-14,
#        "iauPmat06", "13", status);

#    @test isapprox(rbp[1][0], -0.8695404723772031414e-3, 1e-14,
#        "iauPmat06", "21", status);
#    @test isapprox(rbp[1][1], 0.9999996219496027161, 1e-12,
#        "iauPmat06", "22", status);
#    @test isapprox(rbp[1][2], -0.1361752497080270143e-6, 1e-14,
#        "iauPmat06", "23", status);

#    @test isapprox(rbp[2][0], -0.3779734957034089490e-3, 1e-14,
#        "iauPmat06", "31", status);
#    @test isapprox(rbp[2][1], -0.1924880847894457113e-6, 1e-14,
#        "iauPmat06", "32", status);
#    @test isapprox(rbp[2][2], 0.9999999285679971958, 1e-12,
#        "iauPmat06", "33", status);
# end

# let
#    double rmatp[3][3];


#    iauPmat76(2400000.5, 50123.9999, rmatp);

#    @test isapprox(rmatp[0][0], 0.9999995504328350733, 1e-12,
#        "iauPmat76", "11", status);
#    @test isapprox(rmatp[0][1], 0.8696632209480960785e-3, 1e-14,
#        "iauPmat76", "12", status);
#    @test isapprox(rmatp[0][2], 0.3779153474959888345e-3, 1e-14,
#        "iauPmat76", "13", status);

#    @test isapprox(rmatp[1][0], -0.8696632209485112192e-3, 1e-14,
#        "iauPmat76", "21", status);
#    @test isapprox(rmatp[1][1], 0.9999996218428560614, 1e-12,
#        "iauPmat76", "22", status);
#    @test isapprox(rmatp[1][2], -0.1643284776111886407e-6, 1e-14,
#        "iauPmat76", "23", status);

#    @test isapprox(rmatp[2][0], -0.3779153474950335077e-3, 1e-14,
#        "iauPmat76", "31", status);
#    @test isapprox(rmatp[2][1], -0.1643306746147366896e-6, 1e-14,
#        "iauPmat76", "32", status);
#    @test isapprox(rmatp[2][2], 0.9999999285899790119, 1e-12,
#        "iauPmat76", "33", status);
# end

# let
#    double p[3], r;


#    p[0] =  0.3;
#    p[1] =  1.2;
#    p[2] = -2.5;

#    r = iauPm(p);

#    @test isapprox(r, 2.789265136196270604, 1e-12, "iauPm", "", status);
# end

# let
#    double a[3], b[3], amb[3];


#    a[0] = 2.0;
#    a[1] = 2.0;
#    a[2] = 3.0;

#    b[0] = 1.0;
#    b[1] = 3.0;
#    b[2] = 4.0;

#    iauPmp(a, b, amb);

#    @test isapprox(amb[0],  1.0, 1e-12, "iauPmp", "0", status);
#    @test isapprox(amb[1], -1.0, 1e-12, "iauPmp", "1", status);
#    @test isapprox(amb[2], -1.0, 1e-12, "iauPmp", "2", status);
# end

# let
#    double rc, dc, pr, pd, px, rv, pmt, pob[3], pco[3];


#    rc = 1.234;
#    dc = 0.789;
#    pr = 1e-5;
#    pd = -2e-5;
#    px = 1e-2;
#    rv = 10.0;
#    pmt = 8.75;
#    pob[0] = 0.9;
#    pob[1] = 0.4;
#    pob[2] = 0.1;

#    iauPmpx(rc, dc, pr, pd, px, rv, pmt, pob, pco);

#    @test isapprox(pco[0], 0.2328137623960308438, 1e-12,
#                "iauPmpx", "1", status);
#    @test isapprox(pco[1], 0.6651097085397855328, 1e-12,
#                "iauPmpx", "2", status);
#    @test isapprox(pco[2], 0.7095257765896359837, 1e-12,
#                "iauPmpx", "3", status);
# end

# let
#    int j;
#    double ra1, dec1, pmr1, pmd1, px1, rv1, ep1a, ep1b, ep2a, ep2b,
#           ra2, dec2, pmr2, pmd2, px2, rv2;


#    ra1 = 1.234;
#    dec1 = 0.789;
#    pmr1 = 1e-5;
#    pmd1 = -2e-5;
#    px1 = 1e-2;
#    rv1 = 10.0;
#    ep1a = 2400000.5;
#    ep1b = 48348.5625;
#    ep2a = 2400000.5;
#    ep2b = 51544.5;

#    j = iauPmsafe(ra1, dec1, pmr1, pmd1, px1, rv1,
#                  ep1a, ep1b, ep2a, ep2b,
#                  &ra2, &dec2, &pmr2, &pmd2, &px2, &rv2);

#    @test isapprox(ra2, 1.234087484501017061, 1e-12,
#             "iauPmsafe", "ra2", status);
#    @test isapprox(dec2, 0.7888249982450468567, 1e-12,
#             "iauPmsafe", "dec2", status);
#    @test isapprox(pmr2, 0.9996457663586073988e-5, 1e-12,
#              "iauPmsafe", "pmr2", status);
#    @test isapprox(pmd2, -0.2000040085106754565e-4, 1e-16,
#              "iauPmsafe", "pmd2", status);
#    @test isapprox(px2, 0.9999997295356830666e-2, 1e-12,
#             "iauPmsafe", "px2", status);
#    @test isapprox(rv2, 10.38468380293920069, 1e-10,
#             "iauPmsafe", "rv2", status);
#    viv ( j, 0, "iauPmsafe", "j", status);
# end

# let
#    double p[3], r, u[3];


#    p[0] =  0.3;
#    p[1] =  1.2;
#    p[2] = -2.5;

#    iauPn(p, &r, u);

#    @test isapprox(r, 2.789265136196270604, 1e-12, "iauPn", "r", status);

#    @test isapprox(u[0], 0.1075552109073112058, 1e-12, "iauPn", "u1", status);
#    @test isapprox(u[1], 0.4302208436292448232, 1e-12, "iauPn", "u2", status);
#    @test isapprox(u[2], -0.8962934242275933816, 1e-12, "iauPn", "u3", status);
# end

# let
#    double dpsi, deps, epsa,
#           rb[3][3], rp[3][3], rbp[3][3], rn[3][3], rbpn[3][3];


#    dpsi = -0.9632552291149335877e-5;
#    deps =  0.4063197106621141414e-4;

#    iauPn00(2400000.5, 53736.0, dpsi, deps,
#            &epsa, rb, rp, rbp, rn, rbpn);

#    @test isapprox(epsa, 0.4090791789404229916, 1e-12, "iauPn00", "epsa", status);

#    @test isapprox(rb[0][0], 0.9999999999999942498, 1e-12,
#        "iauPn00", "rb11", status);
#    @test isapprox(rb[0][1], -0.7078279744199196626e-7, 1e-18,
#        "iauPn00", "rb12", status);
#    @test isapprox(rb[0][2], 0.8056217146976134152e-7, 1e-18,
#        "iauPn00", "rb13", status);

#    @test isapprox(rb[1][0], 0.7078279477857337206e-7, 1e-18,
#        "iauPn00", "rb21", status);
#    @test isapprox(rb[1][1], 0.9999999999999969484, 1e-12,
#        "iauPn00", "rb22", status);
#    @test isapprox(rb[1][2], 0.3306041454222136517e-7, 1e-18,
#        "iauPn00", "rb23", status);

#    @test isapprox(rb[2][0], -0.8056217380986972157e-7, 1e-18,
#        "iauPn00", "rb31", status);
#    @test isapprox(rb[2][1], -0.3306040883980552500e-7, 1e-18,
#        "iauPn00", "rb32", status);
#    @test isapprox(rb[2][2], 0.9999999999999962084, 1e-12,
#        "iauPn00", "rb33", status);

#    @test isapprox(rp[0][0], 0.9999989300532289018, 1e-12,
#        "iauPn00", "rp11", status);
#    @test isapprox(rp[0][1], -0.1341647226791824349e-2, 1e-14,
#        "iauPn00", "rp12", status);
#    @test isapprox(rp[0][2], -0.5829880927190296547e-3, 1e-14,
#        "iauPn00", "rp13", status);

#    @test isapprox(rp[1][0], 0.1341647231069759008e-2, 1e-14,
#        "iauPn00", "rp21", status);
#    @test isapprox(rp[1][1], 0.9999990999908750433, 1e-12,
#        "iauPn00", "rp22", status);
#    @test isapprox(rp[1][2], -0.3837444441583715468e-6, 1e-14,
#        "iauPn00", "rp23", status);

#    @test isapprox(rp[2][0], 0.5829880828740957684e-3, 1e-14,
#        "iauPn00", "rp31", status);
#    @test isapprox(rp[2][1], -0.3984203267708834759e-6, 1e-14,
#        "iauPn00", "rp32", status);
#    @test isapprox(rp[2][2], 0.9999998300623538046, 1e-12,
#        "iauPn00", "rp33", status);

#    @test isapprox(rbp[0][0], 0.9999989300052243993, 1e-12,
#        "iauPn00", "rbp11", status);
#    @test isapprox(rbp[0][1], -0.1341717990239703727e-2, 1e-14,
#        "iauPn00", "rbp12", status);
#    @test isapprox(rbp[0][2], -0.5829075749891684053e-3, 1e-14,
#        "iauPn00", "rbp13", status);

#    @test isapprox(rbp[1][0], 0.1341718013831739992e-2, 1e-14,
#        "iauPn00", "rbp21", status);
#    @test isapprox(rbp[1][1], 0.9999990998959191343, 1e-12,
#        "iauPn00", "rbp22", status);
#    @test isapprox(rbp[1][2], -0.3505759733565421170e-6, 1e-14,
#        "iauPn00", "rbp23", status);

#    @test isapprox(rbp[2][0], 0.5829075206857717883e-3, 1e-14,
#        "iauPn00", "rbp31", status);
#    @test isapprox(rbp[2][1], -0.4315219955198608970e-6, 1e-14,
#        "iauPn00", "rbp32", status);
#    @test isapprox(rbp[2][2], 0.9999998301093036269, 1e-12,
#        "iauPn00", "rbp33", status);

#    @test isapprox(rn[0][0], 0.9999999999536069682, 1e-12,
#        "iauPn00", "rn11", status);
#    @test isapprox(rn[0][1], 0.8837746144872140812e-5, 1e-16,
#        "iauPn00", "rn12", status);
#    @test isapprox(rn[0][2], 0.3831488838252590008e-5, 1e-16,
#        "iauPn00", "rn13", status);

#    @test isapprox(rn[1][0], -0.8837590456633197506e-5, 1e-16,
#        "iauPn00", "rn21", status);
#    @test isapprox(rn[1][1], 0.9999999991354692733, 1e-12,
#        "iauPn00", "rn22", status);
#    @test isapprox(rn[1][2], -0.4063198798559573702e-4, 1e-16,
#        "iauPn00", "rn23", status);

#    @test isapprox(rn[2][0], -0.3831847930135328368e-5, 1e-16,
#        "iauPn00", "rn31", status);
#    @test isapprox(rn[2][1], 0.4063195412258150427e-4, 1e-16,
#        "iauPn00", "rn32", status);
#    @test isapprox(rn[2][2], 0.9999999991671806225, 1e-12,
#        "iauPn00", "rn33", status);

#    @test isapprox(rbpn[0][0], 0.9999989440499982806, 1e-12,
#        "iauPn00", "rbpn11", status);
#    @test isapprox(rbpn[0][1], -0.1332880253640848301e-2, 1e-14,
#        "iauPn00", "rbpn12", status);
#    @test isapprox(rbpn[0][2], -0.5790760898731087295e-3, 1e-14,
#        "iauPn00", "rbpn13", status);

#    @test isapprox(rbpn[1][0], 0.1332856746979948745e-2, 1e-14,
#        "iauPn00", "rbpn21", status);
#    @test isapprox(rbpn[1][1], 0.9999991109064768883, 1e-12,
#        "iauPn00", "rbpn22", status);
#    @test isapprox(rbpn[1][2], -0.4097740555723063806e-4, 1e-14,
#        "iauPn00", "rbpn23", status);

#    @test isapprox(rbpn[2][0], 0.5791301929950205000e-3, 1e-14,
#        "iauPn00", "rbpn31", status);
#    @test isapprox(rbpn[2][1], 0.4020553681373702931e-4, 1e-14,
#        "iauPn00", "rbpn32", status);
#    @test isapprox(rbpn[2][2], 0.9999998314958529887, 1e-12,
#        "iauPn00", "rbpn33", status);
# end

# let
#    double dpsi, deps, epsa,
#           rb[3][3], rp[3][3], rbp[3][3], rn[3][3], rbpn[3][3];


#    iauPn00a(2400000.5, 53736.0,
#             &dpsi, &deps, &epsa, rb, rp, rbp, rn, rbpn);

#    @test isapprox(dpsi, -0.9630909107115518431e-5, 1e-12,
#        "iauPn00a", "dpsi", status);
#    @test isapprox(deps,  0.4063239174001678710e-4, 1e-12,
#        "iauPn00a", "deps", status);
#    @test isapprox(epsa,  0.4090791789404229916, 1e-12, "iauPn00a", "epsa", status);

#    @test isapprox(rb[0][0], 0.9999999999999942498, 1e-12,
#        "iauPn00a", "rb11", status);
#    @test isapprox(rb[0][1], -0.7078279744199196626e-7, 1e-16,
#        "iauPn00a", "rb12", status);
#    @test isapprox(rb[0][2], 0.8056217146976134152e-7, 1e-16,
#        "iauPn00a", "rb13", status);

#    @test isapprox(rb[1][0], 0.7078279477857337206e-7, 1e-16,
#        "iauPn00a", "rb21", status);
#    @test isapprox(rb[1][1], 0.9999999999999969484, 1e-12,
#        "iauPn00a", "rb22", status);
#    @test isapprox(rb[1][2], 0.3306041454222136517e-7, 1e-16,
#        "iauPn00a", "rb23", status);

#    @test isapprox(rb[2][0], -0.8056217380986972157e-7, 1e-16,
#        "iauPn00a", "rb31", status);
#    @test isapprox(rb[2][1], -0.3306040883980552500e-7, 1e-16,
#        "iauPn00a", "rb32", status);
#    @test isapprox(rb[2][2], 0.9999999999999962084, 1e-12,
#        "iauPn00a", "rb33", status);

#    @test isapprox(rp[0][0], 0.9999989300532289018, 1e-12,
#        "iauPn00a", "rp11", status);
#    @test isapprox(rp[0][1], -0.1341647226791824349e-2, 1e-14,
#        "iauPn00a", "rp12", status);
#    @test isapprox(rp[0][2], -0.5829880927190296547e-3, 1e-14,
#        "iauPn00a", "rp13", status);

#    @test isapprox(rp[1][0], 0.1341647231069759008e-2, 1e-14,
#        "iauPn00a", "rp21", status);
#    @test isapprox(rp[1][1], 0.9999990999908750433, 1e-12,
#        "iauPn00a", "rp22", status);
#    @test isapprox(rp[1][2], -0.3837444441583715468e-6, 1e-14,
#        "iauPn00a", "rp23", status);

#    @test isapprox(rp[2][0], 0.5829880828740957684e-3, 1e-14,
#        "iauPn00a", "rp31", status);
#    @test isapprox(rp[2][1], -0.3984203267708834759e-6, 1e-14,
#        "iauPn00a", "rp32", status);
#    @test isapprox(rp[2][2], 0.9999998300623538046, 1e-12,
#        "iauPn00a", "rp33", status);

#    @test isapprox(rbp[0][0], 0.9999989300052243993, 1e-12,
#        "iauPn00a", "rbp11", status);
#    @test isapprox(rbp[0][1], -0.1341717990239703727e-2, 1e-14,
#        "iauPn00a", "rbp12", status);
#    @test isapprox(rbp[0][2], -0.5829075749891684053e-3, 1e-14,
#        "iauPn00a", "rbp13", status);

#    @test isapprox(rbp[1][0], 0.1341718013831739992e-2, 1e-14,
#        "iauPn00a", "rbp21", status);
#    @test isapprox(rbp[1][1], 0.9999990998959191343, 1e-12,
#        "iauPn00a", "rbp22", status);
#    @test isapprox(rbp[1][2], -0.3505759733565421170e-6, 1e-14,
#        "iauPn00a", "rbp23", status);

#    @test isapprox(rbp[2][0], 0.5829075206857717883e-3, 1e-14,
#        "iauPn00a", "rbp31", status);
#    @test isapprox(rbp[2][1], -0.4315219955198608970e-6, 1e-14,
#        "iauPn00a", "rbp32", status);
#    @test isapprox(rbp[2][2], 0.9999998301093036269, 1e-12,
#        "iauPn00a", "rbp33", status);

#    @test isapprox(rn[0][0], 0.9999999999536227949, 1e-12,
#        "iauPn00a", "rn11", status);
#    @test isapprox(rn[0][1], 0.8836238544090873336e-5, 1e-14,
#        "iauPn00a", "rn12", status);
#    @test isapprox(rn[0][2], 0.3830835237722400669e-5, 1e-14,
#        "iauPn00a", "rn13", status);

#    @test isapprox(rn[1][0], -0.8836082880798569274e-5, 1e-14,
#        "iauPn00a", "rn21", status);
#    @test isapprox(rn[1][1], 0.9999999991354655028, 1e-12,
#        "iauPn00a", "rn22", status);
#    @test isapprox(rn[1][2], -0.4063240865362499850e-4, 1e-14,
#        "iauPn00a", "rn23", status);

#    @test isapprox(rn[2][0], -0.3831194272065995866e-5, 1e-14,
#        "iauPn00a", "rn31", status);
#    @test isapprox(rn[2][1], 0.4063237480216291775e-4, 1e-14,
#        "iauPn00a", "rn32", status);
#    @test isapprox(rn[2][2], 0.9999999991671660338, 1e-12,
#        "iauPn00a", "rn33", status);

#    @test isapprox(rbpn[0][0], 0.9999989440476103435, 1e-12,
#        "iauPn00a", "rbpn11", status);
#    @test isapprox(rbpn[0][1], -0.1332881761240011763e-2, 1e-14,
#        "iauPn00a", "rbpn12", status);
#    @test isapprox(rbpn[0][2], -0.5790767434730085751e-3, 1e-14,
#        "iauPn00a", "rbpn13", status);

#    @test isapprox(rbpn[1][0], 0.1332858254308954658e-2, 1e-14,
#        "iauPn00a", "rbpn21", status);
#    @test isapprox(rbpn[1][1], 0.9999991109044505577, 1e-12,
#        "iauPn00a", "rbpn22", status);
#    @test isapprox(rbpn[1][2], -0.4097782710396580452e-4, 1e-14,
#        "iauPn00a", "rbpn23", status);

#    @test isapprox(rbpn[2][0], 0.5791308472168152904e-3, 1e-14,
#        "iauPn00a", "rbpn31", status);
#    @test isapprox(rbpn[2][1], 0.4020595661591500259e-4, 1e-14,
#        "iauPn00a", "rbpn32", status);
#    @test isapprox(rbpn[2][2], 0.9999998314954572304, 1e-12,
#        "iauPn00a", "rbpn33", status);
# end

# let
#    double dpsi, deps, epsa,
#           rb[3][3], rp[3][3], rbp[3][3], rn[3][3], rbpn[3][3];


#    iauPn00b(2400000.5, 53736.0, &dpsi, &deps, &epsa,
#             rb, rp, rbp, rn, rbpn);

#    @test isapprox(dpsi, -0.9632552291148362783e-5, 1e-12,
#        "iauPn00b", "dpsi", status);
#    @test isapprox(deps,  0.4063197106621159367e-4, 1e-12,
#        "iauPn00b", "deps", status);
#    @test isapprox(epsa,  0.4090791789404229916, 1e-12, "iauPn00b", "epsa", status);

#    @test isapprox(rb[0][0], 0.9999999999999942498, 1e-12,
#       "iauPn00b", "rb11", status);
#    @test isapprox(rb[0][1], -0.7078279744199196626e-7, 1e-16,
#       "iauPn00b", "rb12", status);
#    @test isapprox(rb[0][2], 0.8056217146976134152e-7, 1e-16,
#       "iauPn00b", "rb13", status);

#    @test isapprox(rb[1][0], 0.7078279477857337206e-7, 1e-16,
#       "iauPn00b", "rb21", status);
#    @test isapprox(rb[1][1], 0.9999999999999969484, 1e-12,
#       "iauPn00b", "rb22", status);
#    @test isapprox(rb[1][2], 0.3306041454222136517e-7, 1e-16,
#       "iauPn00b", "rb23", status);

#    @test isapprox(rb[2][0], -0.8056217380986972157e-7, 1e-16,
#       "iauPn00b", "rb31", status);
#    @test isapprox(rb[2][1], -0.3306040883980552500e-7, 1e-16,
#       "iauPn00b", "rb32", status);
#    @test isapprox(rb[2][2], 0.9999999999999962084, 1e-12,
#       "iauPn00b", "rb33", status);

#    @test isapprox(rp[0][0], 0.9999989300532289018, 1e-12,
#       "iauPn00b", "rp11", status);
#    @test isapprox(rp[0][1], -0.1341647226791824349e-2, 1e-14,
#       "iauPn00b", "rp12", status);
#    @test isapprox(rp[0][2], -0.5829880927190296547e-3, 1e-14,
#       "iauPn00b", "rp13", status);

#    @test isapprox(rp[1][0], 0.1341647231069759008e-2, 1e-14,
#       "iauPn00b", "rp21", status);
#    @test isapprox(rp[1][1], 0.9999990999908750433, 1e-12,
#       "iauPn00b", "rp22", status);
#    @test isapprox(rp[1][2], -0.3837444441583715468e-6, 1e-14,
#       "iauPn00b", "rp23", status);

#    @test isapprox(rp[2][0], 0.5829880828740957684e-3, 1e-14,
#       "iauPn00b", "rp31", status);
#    @test isapprox(rp[2][1], -0.3984203267708834759e-6, 1e-14,
#       "iauPn00b", "rp32", status);
#    @test isapprox(rp[2][2], 0.9999998300623538046, 1e-12,
#       "iauPn00b", "rp33", status);

#    @test isapprox(rbp[0][0], 0.9999989300052243993, 1e-12,
#       "iauPn00b", "rbp11", status);
#    @test isapprox(rbp[0][1], -0.1341717990239703727e-2, 1e-14,
#       "iauPn00b", "rbp12", status);
#    @test isapprox(rbp[0][2], -0.5829075749891684053e-3, 1e-14,
#       "iauPn00b", "rbp13", status);

#    @test isapprox(rbp[1][0], 0.1341718013831739992e-2, 1e-14,
#       "iauPn00b", "rbp21", status);
#    @test isapprox(rbp[1][1], 0.9999990998959191343, 1e-12,
#       "iauPn00b", "rbp22", status);
#    @test isapprox(rbp[1][2], -0.3505759733565421170e-6, 1e-14,
#       "iauPn00b", "rbp23", status);

#    @test isapprox(rbp[2][0], 0.5829075206857717883e-3, 1e-14,
#       "iauPn00b", "rbp31", status);
#    @test isapprox(rbp[2][1], -0.4315219955198608970e-6, 1e-14,
#       "iauPn00b", "rbp32", status);
#    @test isapprox(rbp[2][2], 0.9999998301093036269, 1e-12,
#       "iauPn00b", "rbp33", status);

#    @test isapprox(rn[0][0], 0.9999999999536069682, 1e-12,
#       "iauPn00b", "rn11", status);
#    @test isapprox(rn[0][1], 0.8837746144871248011e-5, 1e-14,
#       "iauPn00b", "rn12", status);
#    @test isapprox(rn[0][2], 0.3831488838252202945e-5, 1e-14,
#       "iauPn00b", "rn13", status);

#    @test isapprox(rn[1][0], -0.8837590456632304720e-5, 1e-14,
#       "iauPn00b", "rn21", status);
#    @test isapprox(rn[1][1], 0.9999999991354692733, 1e-12,
#       "iauPn00b", "rn22", status);
#    @test isapprox(rn[1][2], -0.4063198798559591654e-4, 1e-14,
#       "iauPn00b", "rn23", status);

#    @test isapprox(rn[2][0], -0.3831847930134941271e-5, 1e-14,
#       "iauPn00b", "rn31", status);
#    @test isapprox(rn[2][1], 0.4063195412258168380e-4, 1e-14,
#       "iauPn00b", "rn32", status);
#    @test isapprox(rn[2][2], 0.9999999991671806225, 1e-12,
#       "iauPn00b", "rn33", status);

#    @test isapprox(rbpn[0][0], 0.9999989440499982806, 1e-12,
#       "iauPn00b", "rbpn11", status);
#    @test isapprox(rbpn[0][1], -0.1332880253640849194e-2, 1e-14,
#       "iauPn00b", "rbpn12", status);
#    @test isapprox(rbpn[0][2], -0.5790760898731091166e-3, 1e-14,
#       "iauPn00b", "rbpn13", status);

#    @test isapprox(rbpn[1][0], 0.1332856746979949638e-2, 1e-14,
#       "iauPn00b", "rbpn21", status);
#    @test isapprox(rbpn[1][1], 0.9999991109064768883, 1e-12,
#       "iauPn00b", "rbpn22", status);
#    @test isapprox(rbpn[1][2], -0.4097740555723081811e-4, 1e-14,
#       "iauPn00b", "rbpn23", status);

#    @test isapprox(rbpn[2][0], 0.5791301929950208873e-3, 1e-14,
#       "iauPn00b", "rbpn31", status);
#    @test isapprox(rbpn[2][1], 0.4020553681373720832e-4, 1e-14,
#       "iauPn00b", "rbpn32", status);
#    @test isapprox(rbpn[2][2], 0.9999998314958529887, 1e-12,
#       "iauPn00b", "rbpn33", status);
# end

# let
#    double dpsi, deps, epsa;
#    double rb[3][3], rp[3][3], rbp[3][3], rn[3][3], rbpn[3][3];


#    iauPn06a(2400000.5, 53736.0, &dpsi, &deps, &epsa,
#             rb, rp, rbp, rn, rbpn);

#    @test isapprox(dpsi, -0.9630912025820308797e-5, 1e-12,
#        "iauPn06a", "dpsi", status);
#    @test isapprox(deps,  0.4063238496887249798e-4, 1e-12,
#        "iauPn06a", "deps", status);
#    @test isapprox(epsa,  0.4090789763356509926, 1e-12, "iauPn06a", "epsa", status);

#    @test isapprox(rb[0][0], 0.9999999999999942497, 1e-12,
#        "iauPn06a", "rb11", status);
#    @test isapprox(rb[0][1], -0.7078368960971557145e-7, 1e-14,
#        "iauPn06a", "rb12", status);
#    @test isapprox(rb[0][2], 0.8056213977613185606e-7, 1e-14,
#        "iauPn06a", "rb13", status);

#    @test isapprox(rb[1][0], 0.7078368694637674333e-7, 1e-14,
#        "iauPn06a", "rb21", status);
#    @test isapprox(rb[1][1], 0.9999999999999969484, 1e-12,
#        "iauPn06a", "rb22", status);
#    @test isapprox(rb[1][2], 0.3305943742989134124e-7, 1e-14,
#        "iauPn06a", "rb23", status);

#    @test isapprox(rb[2][0], -0.8056214211620056792e-7, 1e-14,
#        "iauPn06a", "rb31", status);
#    @test isapprox(rb[2][1], -0.3305943172740586950e-7, 1e-14,
#        "iauPn06a", "rb32", status);
#    @test isapprox(rb[2][2], 0.9999999999999962084, 1e-12,
#        "iauPn06a", "rb33", status);

#    @test isapprox(rp[0][0], 0.9999989300536854831, 1e-12,
#        "iauPn06a", "rp11", status);
#    @test isapprox(rp[0][1], -0.1341646886204443795e-2, 1e-14,
#        "iauPn06a", "rp12", status);
#    @test isapprox(rp[0][2], -0.5829880933488627759e-3, 1e-14,
#        "iauPn06a", "rp13", status);

#    @test isapprox(rp[1][0], 0.1341646890569782183e-2, 1e-14,
#        "iauPn06a", "rp21", status);
#    @test isapprox(rp[1][1], 0.9999990999913319321, 1e-12,
#        "iauPn06a", "rp22", status);
#    @test isapprox(rp[1][2], -0.3835944216374477457e-6, 1e-14,
#        "iauPn06a", "rp23", status);

#    @test isapprox(rp[2][0], 0.5829880833027867368e-3, 1e-14,
#        "iauPn06a", "rp31", status);
#    @test isapprox(rp[2][1], -0.3985701514686976112e-6, 1e-14,
#        "iauPn06a", "rp32", status);
#    @test isapprox(rp[2][2], 0.9999998300623534950, 1e-12,
#        "iauPn06a", "rp33", status);

#    @test isapprox(rbp[0][0], 0.9999989300056797893, 1e-12,
#        "iauPn06a", "rbp11", status);
#    @test isapprox(rbp[0][1], -0.1341717650545059598e-2, 1e-14,
#        "iauPn06a", "rbp12", status);
#    @test isapprox(rbp[0][2], -0.5829075756493728856e-3, 1e-14,
#        "iauPn06a", "rbp13", status);

#    @test isapprox(rbp[1][0], 0.1341717674223918101e-2, 1e-14,
#        "iauPn06a", "rbp21", status);
#    @test isapprox(rbp[1][1], 0.9999990998963748448, 1e-12,
#        "iauPn06a", "rbp22", status);
#    @test isapprox(rbp[1][2], -0.3504269280170069029e-6, 1e-14,
#        "iauPn06a", "rbp23", status);

#    @test isapprox(rbp[2][0], 0.5829075211461454599e-3, 1e-14,
#        "iauPn06a", "rbp31", status);
#    @test isapprox(rbp[2][1], -0.4316708436255949093e-6, 1e-14,
#        "iauPn06a", "rbp32", status);
#    @test isapprox(rbp[2][2], 0.9999998301093032943, 1e-12,
#        "iauPn06a", "rbp33", status);

#    @test isapprox(rn[0][0], 0.9999999999536227668, 1e-12,
#        "iauPn06a", "rn11", status);
#    @test isapprox(rn[0][1], 0.8836241998111535233e-5, 1e-14,
#        "iauPn06a", "rn12", status);
#    @test isapprox(rn[0][2], 0.3830834608415287707e-5, 1e-14,
#        "iauPn06a", "rn13", status);

#    @test isapprox(rn[1][0], -0.8836086334870740138e-5, 1e-14,
#        "iauPn06a", "rn21", status);
#    @test isapprox(rn[1][1], 0.9999999991354657474, 1e-12,
#        "iauPn06a", "rn22", status);
#    @test isapprox(rn[1][2], -0.4063240188248455065e-4, 1e-14,
#        "iauPn06a", "rn23", status);

#    @test isapprox(rn[2][0], -0.3831193642839398128e-5, 1e-14,
#        "iauPn06a", "rn31", status);
#    @test isapprox(rn[2][1], 0.4063236803101479770e-4, 1e-14,
#        "iauPn06a", "rn32", status);
#    @test isapprox(rn[2][2], 0.9999999991671663114, 1e-12,
#        "iauPn06a", "rn33", status);

#    @test isapprox(rbpn[0][0], 0.9999989440480669738, 1e-12,
#        "iauPn06a", "rbpn11", status);
#    @test isapprox(rbpn[0][1], -0.1332881418091915973e-2, 1e-14,
#        "iauPn06a", "rbpn12", status);
#    @test isapprox(rbpn[0][2], -0.5790767447612042565e-3, 1e-14,
#        "iauPn06a", "rbpn13", status);

#    @test isapprox(rbpn[1][0], 0.1332857911250989133e-2, 1e-14,
#        "iauPn06a", "rbpn21", status);
#    @test isapprox(rbpn[1][1], 0.9999991109049141908, 1e-12,
#        "iauPn06a", "rbpn22", status);
#    @test isapprox(rbpn[1][2], -0.4097767128546784878e-4, 1e-14,
#        "iauPn06a", "rbpn23", status);

#    @test isapprox(rbpn[2][0], 0.5791308482835292617e-3, 1e-14,
#        "iauPn06a", "rbpn31", status);
#    @test isapprox(rbpn[2][1], 0.4020580099454020310e-4, 1e-14,
#        "iauPn06a", "rbpn32", status);
#    @test isapprox(rbpn[2][2], 0.9999998314954628695, 1e-12,
#        "iauPn06a", "rbpn33", status);
# end

# let
#    double dpsi, deps, epsa,
#           rb[3][3], rp[3][3], rbp[3][3], rn[3][3], rbpn[3][3];


#    dpsi = -0.9632552291149335877e-5;
#    deps =  0.4063197106621141414e-4;

#    iauPn06(2400000.5, 53736.0, dpsi, deps,
#            &epsa, rb, rp, rbp, rn, rbpn);

#    @test isapprox(epsa, 0.4090789763356509926, 1e-12, "iauPn06", "epsa", status);

#    @test isapprox(rb[0][0], 0.9999999999999942497, 1e-12,
#        "iauPn06", "rb11", status);
#    @test isapprox(rb[0][1], -0.7078368960971557145e-7, 1e-14,
#        "iauPn06", "rb12", status);
#    @test isapprox(rb[0][2], 0.8056213977613185606e-7, 1e-14,
#        "iauPn06", "rb13", status);

#    @test isapprox(rb[1][0], 0.7078368694637674333e-7, 1e-14,
#        "iauPn06", "rb21", status);
#    @test isapprox(rb[1][1], 0.9999999999999969484, 1e-12,
#        "iauPn06", "rb22", status);
#    @test isapprox(rb[1][2], 0.3305943742989134124e-7, 1e-14,
#        "iauPn06", "rb23", status);

#    @test isapprox(rb[2][0], -0.8056214211620056792e-7, 1e-14,
#        "iauPn06", "rb31", status);
#    @test isapprox(rb[2][1], -0.3305943172740586950e-7, 1e-14,
#        "iauPn06", "rb32", status);
#    @test isapprox(rb[2][2], 0.9999999999999962084, 1e-12,
#        "iauPn06", "rb33", status);

#    @test isapprox(rp[0][0], 0.9999989300536854831, 1e-12,
#        "iauPn06", "rp11", status);
#    @test isapprox(rp[0][1], -0.1341646886204443795e-2, 1e-14,
#        "iauPn06", "rp12", status);
#    @test isapprox(rp[0][2], -0.5829880933488627759e-3, 1e-14,
#        "iauPn06", "rp13", status);

#    @test isapprox(rp[1][0], 0.1341646890569782183e-2, 1e-14,
#        "iauPn06", "rp21", status);
#    @test isapprox(rp[1][1], 0.9999990999913319321, 1e-12,
#        "iauPn06", "rp22", status);
#    @test isapprox(rp[1][2], -0.3835944216374477457e-6, 1e-14,
#        "iauPn06", "rp23", status);

#    @test isapprox(rp[2][0], 0.5829880833027867368e-3, 1e-14,
#        "iauPn06", "rp31", status);
#    @test isapprox(rp[2][1], -0.3985701514686976112e-6, 1e-14,
#        "iauPn06", "rp32", status);
#    @test isapprox(rp[2][2], 0.9999998300623534950, 1e-12,
#        "iauPn06", "rp33", status);

#    @test isapprox(rbp[0][0], 0.9999989300056797893, 1e-12,
#        "iauPn06", "rbp11", status);
#    @test isapprox(rbp[0][1], -0.1341717650545059598e-2, 1e-14,
#        "iauPn06", "rbp12", status);
#    @test isapprox(rbp[0][2], -0.5829075756493728856e-3, 1e-14,
#        "iauPn06", "rbp13", status);

#    @test isapprox(rbp[1][0], 0.1341717674223918101e-2, 1e-14,
#        "iauPn06", "rbp21", status);
#    @test isapprox(rbp[1][1], 0.9999990998963748448, 1e-12,
#        "iauPn06", "rbp22", status);
#    @test isapprox(rbp[1][2], -0.3504269280170069029e-6, 1e-14,
#        "iauPn06", "rbp23", status);

#    @test isapprox(rbp[2][0], 0.5829075211461454599e-3, 1e-14,
#        "iauPn06", "rbp31", status);
#    @test isapprox(rbp[2][1], -0.4316708436255949093e-6, 1e-14,
#        "iauPn06", "rbp32", status);
#    @test isapprox(rbp[2][2], 0.9999998301093032943, 1e-12,
#        "iauPn06", "rbp33", status);

#    @test isapprox(rn[0][0], 0.9999999999536069682, 1e-12,
#        "iauPn06", "rn11", status);
#    @test isapprox(rn[0][1], 0.8837746921149881914e-5, 1e-14,
#        "iauPn06", "rn12", status);
#    @test isapprox(rn[0][2], 0.3831487047682968703e-5, 1e-14,
#        "iauPn06", "rn13", status);

#    @test isapprox(rn[1][0], -0.8837591232983692340e-5, 1e-14,
#        "iauPn06", "rn21", status);
#    @test isapprox(rn[1][1], 0.9999999991354692664, 1e-12,
#        "iauPn06", "rn22", status);
#    @test isapprox(rn[1][2], -0.4063198798558931215e-4, 1e-14,
#        "iauPn06", "rn23", status);

#    @test isapprox(rn[2][0], -0.3831846139597250235e-5, 1e-14,
#        "iauPn06", "rn31", status);
#    @test isapprox(rn[2][1], 0.4063195412258792914e-4, 1e-14,
#        "iauPn06", "rn32", status);
#    @test isapprox(rn[2][2], 0.9999999991671806293, 1e-12,
#        "iauPn06", "rn33", status);

#    @test isapprox(rbpn[0][0], 0.9999989440504506688, 1e-12,
#        "iauPn06", "rbpn11", status);
#    @test isapprox(rbpn[0][1], -0.1332879913170492655e-2, 1e-14,
#        "iauPn06", "rbpn12", status);
#    @test isapprox(rbpn[0][2], -0.5790760923225655753e-3, 1e-14,
#        "iauPn06", "rbpn13", status);

#    @test isapprox(rbpn[1][0], 0.1332856406595754748e-2, 1e-14,
#        "iauPn06", "rbpn21", status);
#    @test isapprox(rbpn[1][1], 0.9999991109069366795, 1e-12,
#        "iauPn06", "rbpn22", status);
#    @test isapprox(rbpn[1][2], -0.4097725651142641812e-4, 1e-14,
#        "iauPn06", "rbpn23", status);

#    @test isapprox(rbpn[2][0], 0.5791301952321296716e-3, 1e-14,
#        "iauPn06", "rbpn31", status);
#    @test isapprox(rbpn[2][1], 0.4020538796195230577e-4, 1e-14,
#        "iauPn06", "rbpn32", status);
#    @test isapprox(rbpn[2][2], 0.9999998314958576778, 1e-12,
#        "iauPn06", "rbpn33", status);
# end

# let
#    double rbpn[3][3];


#    iauPnm00a(2400000.5, 50123.9999, rbpn);

#    @test isapprox(rbpn[0][0], 0.9999995832793134257, 1e-12,
#        "iauPnm00a", "11", status);
#    @test isapprox(rbpn[0][1], 0.8372384254137809439e-3, 1e-14,
#        "iauPnm00a", "12", status);
#    @test isapprox(rbpn[0][2], 0.3639684306407150645e-3, 1e-14,
#        "iauPnm00a", "13", status);

#    @test isapprox(rbpn[1][0], -0.8372535226570394543e-3, 1e-14,
#        "iauPnm00a", "21", status);
#    @test isapprox(rbpn[1][1], 0.9999996486491582471, 1e-12,
#        "iauPnm00a", "22", status);
#    @test isapprox(rbpn[1][2], 0.4132915262664072381e-4, 1e-14,
#        "iauPnm00a", "23", status);

#    @test isapprox(rbpn[2][0], -0.3639337004054317729e-3, 1e-14,
#        "iauPnm00a", "31", status);
#    @test isapprox(rbpn[2][1], -0.4163386925461775873e-4, 1e-14,
#        "iauPnm00a", "32", status);
#    @test isapprox(rbpn[2][2], 0.9999999329094390695, 1e-12,
#        "iauPnm00a", "33", status);
# end

# let
#    double rbpn[3][3];


#    iauPnm00b(2400000.5, 50123.9999, rbpn);

#    @test isapprox(rbpn[0][0], 0.9999995832776208280, 1e-12,
#        "iauPnm00b", "11", status);
#    @test isapprox(rbpn[0][1], 0.8372401264429654837e-3, 1e-14,
#        "iauPnm00b", "12", status);
#    @test isapprox(rbpn[0][2], 0.3639691681450271771e-3, 1e-14,
#        "iauPnm00b", "13", status);

#    @test isapprox(rbpn[1][0], -0.8372552234147137424e-3, 1e-14,
#        "iauPnm00b", "21", status);
#    @test isapprox(rbpn[1][1], 0.9999996486477686123, 1e-12,
#        "iauPnm00b", "22", status);
#    @test isapprox(rbpn[1][2], 0.4132832190946052890e-4, 1e-14,
#        "iauPnm00b", "23", status);

#    @test isapprox(rbpn[2][0], -0.3639344385341866407e-3, 1e-14,
#        "iauPnm00b", "31", status);
#    @test isapprox(rbpn[2][1], -0.4163303977421522785e-4, 1e-14,
#        "iauPnm00b", "32", status);
#    @test isapprox(rbpn[2][2], 0.9999999329092049734, 1e-12,
#        "iauPnm00b", "33", status);
# end

# let
#    double rbpn[3][3];


#    iauPnm06a(2400000.5, 50123.9999, rbpn);

#    @test isapprox(rbpn[0][0], 0.9999995832794205484, 1e-12,
#        "iauPnm06a", "11", status);
#    @test isapprox(rbpn[0][1], 0.8372382772630962111e-3, 1e-14,
#        "iauPnm06a", "12", status);
#    @test isapprox(rbpn[0][2], 0.3639684771140623099e-3, 1e-14,
#        "iauPnm06a", "13", status);

#    @test isapprox(rbpn[1][0], -0.8372533744743683605e-3, 1e-14,
#        "iauPnm06a", "21", status);
#    @test isapprox(rbpn[1][1], 0.9999996486492861646, 1e-12,
#        "iauPnm06a", "22", status);
#    @test isapprox(rbpn[1][2], 0.4132905944611019498e-4, 1e-14,
#        "iauPnm06a", "23", status);

#    @test isapprox(rbpn[2][0], -0.3639337469629464969e-3, 1e-14,
#        "iauPnm06a", "31", status);
#    @test isapprox(rbpn[2][1], -0.4163377605910663999e-4, 1e-14,
#        "iauPnm06a", "32", status);
#    @test isapprox(rbpn[2][2], 0.9999999329094260057, 1e-12,
#        "iauPnm06a", "33", status);
# end

# let
#    double rmatpn[3][3];


#    iauPnm80(2400000.5, 50123.9999, rmatpn);

#    @test isapprox(rmatpn[0][0], 0.9999995831934611169, 1e-12,
#        "iauPnm80", "11", status);
#    @test isapprox(rmatpn[0][1], 0.8373654045728124011e-3, 1e-14,
#        "iauPnm80", "12", status);
#    @test isapprox(rmatpn[0][2], 0.3639121916933106191e-3, 1e-14,
#        "iauPnm80", "13", status);

#    @test isapprox(rmatpn[1][0], -0.8373804896118301316e-3, 1e-14,
#        "iauPnm80", "21", status);
#    @test isapprox(rmatpn[1][1], 0.9999996485439674092, 1e-12,
#        "iauPnm80", "22", status);
#    @test isapprox(rmatpn[1][2], 0.4130202510421549752e-4, 1e-14,
#        "iauPnm80", "23", status);

#    @test isapprox(rmatpn[2][0], -0.3638774789072144473e-3, 1e-14,
#        "iauPnm80", "31", status);
#    @test isapprox(rmatpn[2][1], -0.4160674085851722359e-4, 1e-14,
#        "iauPnm80", "32", status);
#    @test isapprox(rmatpn[2][2], 0.9999999329310274805, 1e-12,
#        "iauPnm80", "33", status);
# end

# let
#    double xp, yp, sp, rpom[3][3];


#    xp =  2.55060238e-7;
#    yp =  1.860359247e-6;
#    sp = -0.1367174580728891460e-10;

#    iauPom00(xp, yp, sp, rpom);

#    @test isapprox(rpom[0][0], 0.9999999999999674721, 1e-12,
#        "iauPom00", "11", status);
#    @test isapprox(rpom[0][1], -0.1367174580728846989e-10, 1e-16,
#        "iauPom00", "12", status);
#    @test isapprox(rpom[0][2], 0.2550602379999972345e-6, 1e-16,
#        "iauPom00", "13", status);

#    @test isapprox(rpom[1][0], 0.1414624947957029801e-10, 1e-16,
#        "iauPom00", "21", status);
#    @test isapprox(rpom[1][1], 0.9999999999982695317, 1e-12,
#        "iauPom00", "22", status);
#    @test isapprox(rpom[1][2], -0.1860359246998866389e-5, 1e-16,
#        "iauPom00", "23", status);

#    @test isapprox(rpom[2][0], -0.2550602379741215021e-6, 1e-16,
#        "iauPom00", "31", status);
#    @test isapprox(rpom[2][1], 0.1860359247002414021e-5, 1e-16,
#        "iauPom00", "32", status);
#    @test isapprox(rpom[2][2], 0.9999999999982370039, 1e-12,
#        "iauPom00", "33", status);
# end

# let
#    double a[3], b[3], apb[3];


#    a[0] = 2.0;
#    a[1] = 2.0;
#    a[2] = 3.0;

#    b[0] = 1.0;
#    b[1] = 3.0;
#    b[2] = 4.0;

#    iauPpp(a, b, apb);

#    @test isapprox(apb[0], 3.0, 1e-12, "iauPpp", "0", status);
#    @test isapprox(apb[1], 5.0, 1e-12, "iauPpp", "1", status);
#    @test isapprox(apb[2], 7.0, 1e-12, "iauPpp", "2", status);
# end

# let
#    double a[3], s, b[3], apsb[3];


#    a[0] = 2.0;
#    a[1] = 2.0;
#    a[2] = 3.0;

#    s = 5.0;

#    b[0] = 1.0;
#    b[1] = 3.0;
#    b[2] = 4.0;

#    iauPpsp(a, s, b, apsb);

#    @test isapprox(apsb[0], 7.0, 1e-12, "iauPpsp", "0", status);
#    @test isapprox(apsb[1], 17.0, 1e-12, "iauPpsp", "1", status);
#    @test isapprox(apsb[2], 23.0, 1e-12, "iauPpsp", "2", status);
# end

# let
#    double dpsipr, depspr;

#    iauPr00(2400000.5, 53736, &dpsipr, &depspr);

#    @test isapprox(dpsipr, -0.8716465172668347629e-7, 1e-22,
#       "iauPr00", "dpsipr", status);
#    @test isapprox(depspr, -0.7342018386722813087e-8, 1e-22,
#       "iauPr00", "depspr", status);
# end

# let
#    double ep01, ep02, ep11, ep12, zeta, z, theta;


#    ep01 = 2400000.5;
#    ep02 = 33282.0;
#    ep11 = 2400000.5;
#    ep12 = 51544.0;

#    iauPrec76(ep01, ep02, ep11, ep12, &zeta, &z, &theta);

#    @test isapprox(zeta,  0.5588961642000161243e-2, 1e-12,
#        "iauPrec76", "zeta",  status);
#    @test isapprox(z,     0.5589922365870680624e-2, 1e-12,
#        "iauPrec76", "z",     status);
#    @test isapprox(theta, 0.4858945471687296760e-2, 1e-12,
#        "iauPrec76", "theta", status);
# end

# let
#    double pv[2][3], p[3];


#    pv[0][0] =  0.3;
#    pv[0][1] =  1.2;
#    pv[0][2] = -2.5;

#    pv[1][0] = -0.5;
#    pv[1][1] =  3.1;
#    pv[1][2] =  0.9;

#    iauPv2p(pv, p);

#    @test isapprox(p[0],  0.3, 0.0, "iauPv2p", "1", status);
#    @test isapprox(p[1],  1.2, 0.0, "iauPv2p", "2", status);
#    @test isapprox(p[2], -2.5, 0.0, "iauPv2p", "3", status);
# end

# let
#    double pv[2][3], theta, phi, r, td, pd, rd;


#    pv[0][0] = -0.4514964673880165;
#    pv[0][1] =  0.03093394277342585;
#    pv[0][2] =  0.05594668105108779;

#    pv[1][0] =  1.292270850663260e-5;
#    pv[1][1] =  2.652814182060692e-6;
#    pv[1][2] =  2.568431853930293e-6;

#    iauPv2s(pv, &theta, &phi, &r, &td, &pd, &rd);

#    @test isapprox(theta, 3.073185307179586515, 1e-12, "iauPv2s", "theta", status);
#    @test isapprox(phi, 0.1229999999999999992, 1e-12, "iauPv2s", "phi", status);
#    @test isapprox(r, 0.4559999999999999757, 1e-12, "iauPv2s", "r", status);
#    @test isapprox(td, -0.7800000000000000364e-5, 1e-16, "iauPv2s", "td", status);
#    @test isapprox(pd, 0.9010000000000001639e-5, 1e-16, "iauPv2s", "pd", status);
#    @test isapprox(rd, -0.1229999999999999832e-4, 1e-16, "iauPv2s", "rd", status);
# end

# let
#    double a[2][3], b[2][3], adb[2];


#    a[0][0] = 2.0;
#    a[0][1] = 2.0;
#    a[0][2] = 3.0;

#    a[1][0] = 6.0;
#    a[1][1] = 0.0;
#    a[1][2] = 4.0;

#    b[0][0] = 1.0;
#    b[0][1] = 3.0;
#    b[0][2] = 4.0;

#    b[1][0] = 0.0;
#    b[1][1] = 2.0;
#    b[1][2] = 8.0;

#    iauPvdpv(a, b, adb);

#    @test isapprox(adb[0], 20.0, 1e-12, "iauPvdpv", "1", status);
#    @test isapprox(adb[1], 50.0, 1e-12, "iauPvdpv", "2", status);
# end

# let
#    double pv[2][3], r, s;


#    pv[0][0] =  0.3;
#    pv[0][1] =  1.2;
#    pv[0][2] = -2.5;

#    pv[1][0] =  0.45;
#    pv[1][1] = -0.25;
#    pv[1][2] =  1.1;

#    iauPvm(pv, &r, &s);

#    @test isapprox(r, 2.789265136196270604, 1e-12, "iauPvm", "r", status);
#    @test isapprox(s, 1.214495780149111922, 1e-12, "iauPvm", "s", status);
# end

# let
#    double a[2][3], b[2][3], amb[2][3];


#    a[0][0] = 2.0;
#    a[0][1] = 2.0;
#    a[0][2] = 3.0;

#    a[1][0] = 5.0;
#    a[1][1] = 6.0;
#    a[1][2] = 3.0;

#    b[0][0] = 1.0;
#    b[0][1] = 3.0;
#    b[0][2] = 4.0;

#    b[1][0] = 3.0;
#    b[1][1] = 2.0;
#    b[1][2] = 1.0;

#    iauPvmpv(a, b, amb);

#    @test isapprox(amb[0][0],  1.0, 1e-12, "iauPvmpv", "11", status);
#    @test isapprox(amb[0][1], -1.0, 1e-12, "iauPvmpv", "21", status);
#    @test isapprox(amb[0][2], -1.0, 1e-12, "iauPvmpv", "31", status);

#    @test isapprox(amb[1][0],  2.0, 1e-12, "iauPvmpv", "12", status);
#    @test isapprox(amb[1][1],  4.0, 1e-12, "iauPvmpv", "22", status);
#    @test isapprox(amb[1][2],  2.0, 1e-12, "iauPvmpv", "32", status);
# end

# let
#    double a[2][3], b[2][3], apb[2][3];


#    a[0][0] = 2.0;
#    a[0][1] = 2.0;
#    a[0][2] = 3.0;

#    a[1][0] = 5.0;
#    a[1][1] = 6.0;
#    a[1][2] = 3.0;

#    b[0][0] = 1.0;
#    b[0][1] = 3.0;
#    b[0][2] = 4.0;

#    b[1][0] = 3.0;
#    b[1][1] = 2.0;
#    b[1][2] = 1.0;

#    iauPvppv(a, b, apb);

#    @test isapprox(apb[0][0], 3.0, 1e-12, "iauPvppv", "p1", status);
#    @test isapprox(apb[0][1], 5.0, 1e-12, "iauPvppv", "p2", status);
#    @test isapprox(apb[0][2], 7.0, 1e-12, "iauPvppv", "p3", status);

#    @test isapprox(apb[1][0], 8.0, 1e-12, "iauPvppv", "v1", status);
#    @test isapprox(apb[1][1], 8.0, 1e-12, "iauPvppv", "v2", status);
#    @test isapprox(apb[1][2], 4.0, 1e-12, "iauPvppv", "v3", status);
# end

# let
#    double pv[2][3], ra, dec, pmr, pmd, px, rv;
#    int j;


#    pv[0][0] =  126668.5912743160601;
#    pv[0][1] =  2136.792716839935195;
#    pv[0][2] = -245251.2339876830091;

#    pv[1][0] = -0.4051854035740712739e-2;
#    pv[1][1] = -0.6253919754866173866e-2;
#    pv[1][2] =  0.1189353719774107189e-1;

#    j = iauPvstar(pv, &ra, &dec, &pmr, &pmd, &px, &rv);

#    @test isapprox(ra, 0.1686756e-1, 1e-12, "iauPvstar", "ra", status);
#    @test isapprox(dec, -1.093989828, 1e-12, "iauPvstar", "dec", status);
#    @test isapprox(pmr, -0.1783235160000472788e-4, 1e-16, "iauPvstar", "pmr", status);
#    @test isapprox(pmd, 0.2336024047000619347e-5, 1e-16, "iauPvstar", "pmd", status);
#    @test isapprox(px, 0.74723, 1e-12, "iauPvstar", "px", status);
#    @test isapprox(rv, -21.60000010107306010, 1e-11, "iauPvstar", "rv", status);

#    viv(j, 0, "iauPvstar", "j", status);
# end

# let
#    double elong, phi, hm, xp, yp, sp, theta, pv[2][3];


#    elong = 2.0;
#    phi = 0.5;
#    hm = 3000.0;
#    xp = 1e-6;
#    yp = -0.5e-6;
#    sp = 1e-8;
#    theta = 5.0;

#    iauPvtob(elong, phi, hm, xp, yp, sp, theta, pv);

#    @test isapprox(pv[0][0], 4225081.367071159207, 1e-5,
#                  "iauPvtob", "p(1)", status);
#    @test isapprox(pv[0][1], 3681943.215856198144, 1e-5,
#                  "iauPvtob", "p(2)", status);
#    @test isapprox(pv[0][2], 3041149.399241260785, 1e-5,
#                  "iauPvtob", "p(3)", status);
#    @test isapprox(pv[1][0], -268.4915389365998787, 1e-9,
#                  "iauPvtob", "v(1)", status);
#    @test isapprox(pv[1][1], 308.0977983288903123, 1e-9,
#                  "iauPvtob", "v(2)", status);
#    @test isapprox(pv[1][2], 0, 0,
#                  "iauPvtob", "v(3)", status);
# end

# let
#    double pv[2][3], upv[2][3];


#    pv[0][0] =  126668.5912743160734;
#    pv[0][1] =  2136.792716839935565;
#    pv[0][2] = -245251.2339876830229;

#    pv[1][0] = -0.4051854035740713039e-2;
#    pv[1][1] = -0.6253919754866175788e-2;
#    pv[1][2] =  0.1189353719774107615e-1;

#    iauPvu(2920.0, pv, upv);

#    @test isapprox(upv[0][0], 126656.7598605317105, 1e-12,
#        "iauPvu", "p1", status);
#    @test isapprox(upv[0][1], 2118.531271155726332, 1e-12,
#        "iauPvu", "p2", status);
#    @test isapprox(upv[0][2], -245216.5048590656190, 1e-12,
#        "iauPvu", "p3", status);

#    @test isapprox(upv[1][0], -0.4051854035740713039e-2, 1e-12,
#        "iauPvu", "v1", status);
#    @test isapprox(upv[1][1], -0.6253919754866175788e-2, 1e-12,
#        "iauPvu", "v2", status);
#    @test isapprox(upv[1][2], 0.1189353719774107615e-1, 1e-12,
#        "iauPvu", "v3", status);
# end

# let
#    double pv[2][3], p[3];


#    pv[0][0] =  126668.5912743160734;
#    pv[0][1] =  2136.792716839935565;
#    pv[0][2] = -245251.2339876830229;

#    pv[1][0] = -0.4051854035740713039e-2;
#    pv[1][1] = -0.6253919754866175788e-2;
#    pv[1][2] =  0.1189353719774107615e-1;

#    iauPvup(2920.0, pv, p);

#    @test isapprox(p[0],  126656.7598605317105,   1e-12, "iauPvup", "1", status);
#    @test isapprox(p[1],    2118.531271155726332, 1e-12, "iauPvup", "2", status);
#    @test isapprox(p[2], -245216.5048590656190,   1e-12, "iauPvup", "3", status);
# end

# let
#    double a[2][3], b[2][3], axb[2][3];


#    a[0][0] = 2.0;
#    a[0][1] = 2.0;
#    a[0][2] = 3.0;

#    a[1][0] = 6.0;
#    a[1][1] = 0.0;
#    a[1][2] = 4.0;

#    b[0][0] = 1.0;
#    b[0][1] = 3.0;
#    b[0][2] = 4.0;

#    b[1][0] = 0.0;
#    b[1][1] = 2.0;
#    b[1][2] = 8.0;

#    iauPvxpv(a, b, axb);

#    @test isapprox(axb[0][0],  -1.0, 1e-12, "iauPvxpv", "p1", status);
#    @test isapprox(axb[0][1],  -5.0, 1e-12, "iauPvxpv", "p2", status);
#    @test isapprox(axb[0][2],   4.0, 1e-12, "iauPvxpv", "p3", status);

#    @test isapprox(axb[1][0],  -2.0, 1e-12, "iauPvxpv", "v1", status);
#    @test isapprox(axb[1][1], -36.0, 1e-12, "iauPvxpv", "v2", status);
#    @test isapprox(axb[1][2],  22.0, 1e-12, "iauPvxpv", "v3", status);
# end

# let
#    double a[3], b[3], axb[3];


#    a[0] = 2.0;
#    a[1] = 2.0;
#    a[2] = 3.0;

#    b[0] = 1.0;
#    b[1] = 3.0;
#    b[2] = 4.0;

#    iauPxp(a, b, axb);

#    @test isapprox(axb[0], -1.0, 1e-12, "iauPxp", "1", status);
#    @test isapprox(axb[1], -5.0, 1e-12, "iauPxp", "2", status);
#    @test isapprox(axb[2],  4.0, 1e-12, "iauPxp", "3", status);
# end

# let
#    double phpa, tc, rh, wl, refa, refb;


#    phpa = 800.0;
#    tc = 10.0;
#    rh = 0.9;
#    wl = 0.4;

#    iauRefco(phpa, tc, rh, wl, &refa, &refb);

#    @test isapprox(refa, 0.2264949956241415009e-3, 1e-15,
#              "iauRefco", "refa", status);
#    @test isapprox(refb, -0.2598658261729343970e-6, 1e-18,
#              "iauRefco", "refb", status);
# end

# let
#    double r[3][3], w[3];


#    r[0][0] =  0.00;
#    r[0][1] = -0.80;
#    r[0][2] = -0.60;

#    r[1][0] =  0.80;
#    r[1][1] = -0.36;
#    r[1][2] =  0.48;

#    r[2][0] =  0.60;
#    r[2][1] =  0.48;
#    r[2][2] = -0.64;

#    iauRm2v(r, w);

#    @test isapprox(w[0],  0.0,                  1e-12, "iauRm2v", "1", status);
#    @test isapprox(w[1],  1.413716694115406957, 1e-12, "iauRm2v", "2", status);
#    @test isapprox(w[2], -1.884955592153875943, 1e-12, "iauRm2v", "3", status);
# end

# let
#    double w[3], r[3][3];


#    w[0] =  0.0;
#    w[1] =  1.41371669;
#    w[2] = -1.88495559;

#    iauRv2m(w, r);

#    @test isapprox(r[0][0], -0.7071067782221119905, 1e-14, "iauRv2m", "11", status);
#    @test isapprox(r[0][1], -0.5656854276809129651, 1e-14, "iauRv2m", "12", status);
#    @test isapprox(r[0][2], -0.4242640700104211225, 1e-14, "iauRv2m", "13", status);

#    @test isapprox(r[1][0],  0.5656854276809129651, 1e-14, "iauRv2m", "21", status);
#    @test isapprox(r[1][1], -0.0925483394532274246, 1e-14, "iauRv2m", "22", status);
#    @test isapprox(r[1][2], -0.8194112531408833269, 1e-14, "iauRv2m", "23", status);

#    @test isapprox(r[2][0],  0.4242640700104211225, 1e-14, "iauRv2m", "31", status);
#    @test isapprox(r[2][1], -0.8194112531408833269, 1e-14, "iauRv2m", "32", status);
#    @test isapprox(r[2][2],  0.3854415612311154341, 1e-14, "iauRv2m", "33", status);
# end

# let
#    double phi, r[3][3];


#    phi = 0.3456789;

#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    iauRx(phi, r);

#    @test isapprox(r[0][0], 2.0, 0.0, "iauRx", "11", status);
#    @test isapprox(r[0][1], 3.0, 0.0, "iauRx", "12", status);
#    @test isapprox(r[0][2], 2.0, 0.0, "iauRx", "13", status);

#    @test isapprox(r[1][0], 3.839043388235612460, 1e-12, "iauRx", "21", status);
#    @test isapprox(r[1][1], 3.237033249594111899, 1e-12, "iauRx", "22", status);
#    @test isapprox(r[1][2], 4.516714379005982719, 1e-12, "iauRx", "23", status);

#    @test isapprox(r[2][0], 1.806030415924501684, 1e-12, "iauRx", "31", status);
#    @test isapprox(r[2][1], 3.085711545336372503, 1e-12, "iauRx", "32", status);
#    @test isapprox(r[2][2], 3.687721683977873065, 1e-12, "iauRx", "33", status);
# end

# let
#    double r[3][3], p[3], rp[3];


#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    p[0] = 0.2;
#    p[1] = 1.5;
#    p[2] = 0.1;

#    iauRxp(r, p, rp);

#    @test isapprox(rp[0], 5.1, 1e-12, "iauRxp", "1", status);
#    @test isapprox(rp[1], 3.9, 1e-12, "iauRxp", "2", status);
#    @test isapprox(rp[2], 7.1, 1e-12, "iauRxp", "3", status);
# end

# let
#    double r[3][3], pv[2][3], rpv[2][3];


#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    pv[0][0] = 0.2;
#    pv[0][1] = 1.5;
#    pv[0][2] = 0.1;

#    pv[1][0] = 1.5;
#    pv[1][1] = 0.2;
#    pv[1][2] = 0.1;

#    iauRxpv(r, pv, rpv);

#    @test isapprox(rpv[0][0], 5.1, 1e-12, "iauRxpv", "11", status);
#    @test isapprox(rpv[1][0], 3.8, 1e-12, "iauRxpv", "12", status);

#    @test isapprox(rpv[0][1], 3.9, 1e-12, "iauRxpv", "21", status);
#    @test isapprox(rpv[1][1], 5.2, 1e-12, "iauRxpv", "22", status);

#    @test isapprox(rpv[0][2], 7.1, 1e-12, "iauRxpv", "31", status);
#    @test isapprox(rpv[1][2], 5.8, 1e-12, "iauRxpv", "32", status);
# end

# let
#    double a[3][3], b[3][3], atb[3][3];


#    a[0][0] = 2.0;
#    a[0][1] = 3.0;
#    a[0][2] = 2.0;

#    a[1][0] = 3.0;
#    a[1][1] = 2.0;
#    a[1][2] = 3.0;

#    a[2][0] = 3.0;
#    a[2][1] = 4.0;
#    a[2][2] = 5.0;

#    b[0][0] = 1.0;
#    b[0][1] = 2.0;
#    b[0][2] = 2.0;

#    b[1][0] = 4.0;
#    b[1][1] = 1.0;
#    b[1][2] = 1.0;

#    b[2][0] = 3.0;
#    b[2][1] = 0.0;
#    b[2][2] = 1.0;

#    iauRxr(a, b, atb);

#    @test isapprox(atb[0][0], 20.0, 1e-12, "iauRxr", "11", status);
#    @test isapprox(atb[0][1],  7.0, 1e-12, "iauRxr", "12", status);
#    @test isapprox(atb[0][2],  9.0, 1e-12, "iauRxr", "13", status);

#    @test isapprox(atb[1][0], 20.0, 1e-12, "iauRxr", "21", status);
#    @test isapprox(atb[1][1],  8.0, 1e-12, "iauRxr", "22", status);
#    @test isapprox(atb[1][2], 11.0, 1e-12, "iauRxr", "23", status);

#    @test isapprox(atb[2][0], 34.0, 1e-12, "iauRxr", "31", status);
#    @test isapprox(atb[2][1], 10.0, 1e-12, "iauRxr", "32", status);
#    @test isapprox(atb[2][2], 15.0, 1e-12, "iauRxr", "33", status);
# end

# let
#    double theta, r[3][3];


#    theta = 0.3456789;

#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    iauRy(theta, r);

#    @test isapprox(r[0][0], 0.8651847818978159930, 1e-12, "iauRy", "11", status);
#    @test isapprox(r[0][1], 1.467194920539316554, 1e-12, "iauRy", "12", status);
#    @test isapprox(r[0][2], 0.1875137911274457342, 1e-12, "iauRy", "13", status);

#    @test isapprox(r[1][0], 3, 1e-12, "iauRy", "21", status);
#    @test isapprox(r[1][1], 2, 1e-12, "iauRy", "22", status);
#    @test isapprox(r[1][2], 3, 1e-12, "iauRy", "23", status);

#    @test isapprox(r[2][0], 3.500207892850427330, 1e-12, "iauRy", "31", status);
#    @test isapprox(r[2][1], 4.779889022262298150, 1e-12, "iauRy", "32", status);
#    @test isapprox(r[2][2], 5.381899160903798712, 1e-12, "iauRy", "33", status);
# end

# let
#    double psi, r[3][3];


#    psi = 0.3456789;

#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    iauRz(psi, r);

#    @test isapprox(r[0][0], 2.898197754208926769, 1e-12, "iauRz", "11", status);
#    @test isapprox(r[0][1], 3.500207892850427330, 1e-12, "iauRz", "12", status);
#    @test isapprox(r[0][2], 2.898197754208926769, 1e-12, "iauRz", "13", status);

#    @test isapprox(r[1][0], 2.144865911309686813, 1e-12, "iauRz", "21", status);
#    @test isapprox(r[1][1], 0.865184781897815993, 1e-12, "iauRz", "22", status);
#    @test isapprox(r[1][2], 2.144865911309686813, 1e-12, "iauRz", "23", status);

#    @test isapprox(r[2][0], 3.0, 1e-12, "iauRz", "31", status);
#    @test isapprox(r[2][1], 4.0, 1e-12, "iauRz", "32", status);
#    @test isapprox(r[2][2], 5.0, 1e-12, "iauRz", "33", status);
# end

# let
#    double s;


#    s = iauS00a(2400000.5, 52541.0);

#    @test isapprox(s, -0.1340684448919163584e-7, 1e-18, "iauS00a", "", status);
# end

# let
#    double s;


#    s = iauS00b(2400000.5, 52541.0);

#    @test isapprox(s, -0.1340695782951026584e-7, 1e-18, "iauS00b", "", status);
# end

# let
#    double x, y, s;


#    x = 0.5791308486706011000e-3;
#    y = 0.4020579816732961219e-4;

#    s = iauS00(2400000.5, 53736.0, x, y);

#    @test isapprox(s, -0.1220036263270905693e-7, 1e-18, "iauS00", "", status);
# end

# let
#    double s;


#    s = iauS06a(2400000.5, 52541.0);

#    @test isapprox(s, -0.1340680437291812383e-7, 1e-18, "iauS06a", "", status);
# end

# let
#    double x, y, s;


#    x = 0.5791308486706011000e-3;
#    y = 0.4020579816732961219e-4;

#    s = iauS06(2400000.5, 53736.0, x, y);

#    @test isapprox(s, -0.1220032213076463117e-7, 1e-18, "iauS06", "", status);
# end

# let
#    double c[3];


#    iauS2c(3.0123, -0.999, c);

#    @test isapprox(c[0], -0.5366267667260523906, 1e-12, "iauS2c", "1", status);
#    @test isapprox(c[1],  0.0697711109765145365, 1e-12, "iauS2c", "2", status);
#    @test isapprox(c[2], -0.8409302618566214041, 1e-12, "iauS2c", "3", status);
# end

# let
#    double p[3];


#    iauS2p(-3.21, 0.123, 0.456, p);

#    @test isapprox(p[0], -0.4514964673880165228, 1e-12, "iauS2p", "x", status);
#    @test isapprox(p[1],  0.0309339427734258688, 1e-12, "iauS2p", "y", status);
#    @test isapprox(p[2],  0.0559466810510877933, 1e-12, "iauS2p", "z", status);
# end

# let
#    double pv[2][3];


#    iauS2pv(-3.21, 0.123, 0.456, -7.8e-6, 9.01e-6, -1.23e-5, pv);

#    @test isapprox(pv[0][0], -0.4514964673880165228, 1e-12, "iauS2pv", "x", status);
#    @test isapprox(pv[0][1],  0.0309339427734258688, 1e-12, "iauS2pv", "y", status);
#    @test isapprox(pv[0][2],  0.0559466810510877933, 1e-12, "iauS2pv", "z", status);

#    @test isapprox(pv[1][0],  0.1292270850663260170e-4, 1e-16,
#        "iauS2pv", "vx", status);
#    @test isapprox(pv[1][1],  0.2652814182060691422e-5, 1e-16,
#        "iauS2pv", "vy", status);
#    @test isapprox(pv[1][2],  0.2568431853930292259e-5, 1e-16,
#        "iauS2pv", "vz", status);
# end

# let
#    double s1, s2, pv[2][3], spv[2][3];


#    s1 = 2.0;
#    s2 = 3.0;

#    pv[0][0] =  0.3;
#    pv[0][1] =  1.2;
#    pv[0][2] = -2.5;

#    pv[1][0] =  0.5;
#    pv[1][1] =  2.3;
#    pv[1][2] = -0.4;

#    iauS2xpv(s1, s2, pv, spv);

#    @test isapprox(spv[0][0],  0.6, 1e-12, "iauS2xpv", "p1", status);
#    @test isapprox(spv[0][1],  2.4, 1e-12, "iauS2xpv", "p2", status);
#    @test isapprox(spv[0][2], -5.0, 1e-12, "iauS2xpv", "p3", status);

#    @test isapprox(spv[1][0],  1.5, 1e-12, "iauS2xpv", "v1", status);
#    @test isapprox(spv[1][1],  6.9, 1e-12, "iauS2xpv", "v2", status);
#    @test isapprox(spv[1][2], -1.2, 1e-12, "iauS2xpv", "v3", status);
# end

# let
#    double a[3], b[3], s;


#    a[0] =  1.0;
#    a[1] =  0.1;
#    a[2] =  0.2;

#    b[0] = -3.0;
#    b[1] =  1e-3;
#    b[2] =  0.2;

#    s = iauSepp(a, b);

#    @test isapprox(s, 2.860391919024660768, 1e-12, "iauSepp", "", status);
# end

# let
#    double al, ap, bl, bp, s;


#    al =  1.0;
#    ap =  0.1;

#    bl =  0.2;
#    bp = -3.0;

#    s = iauSeps(al, ap, bl, bp);

#    @test isapprox(s, 2.346722016996998842, 1e-14, "iauSeps", "", status);
# end

# let
#    @test isapprox(iauSp00(2400000.5, 52541.0),
#        -0.6216698469981019309e-11, 1e-12, "iauSp00", "", status);
# end

# let
#    double ra1, dec1, pmr1, pmd1, px1, rv1;
#    double ra2, dec2, pmr2, pmd2, px2, rv2;
#    int j;


#    ra1 =   0.01686756;
#    dec1 = -1.093989828;
#    pmr1 = -1.78323516e-5;
#    pmd1 =  2.336024047e-6;
#    px1 =   0.74723;
#    rv1 = -21.6;

#    j = iauStarpm(ra1, dec1, pmr1, pmd1, px1, rv1,
#                  2400000.5, 50083.0, 2400000.5, 53736.0,
#                  &ra2, &dec2, &pmr2, &pmd2, &px2, &rv2);

#    @test isapprox(ra2, 0.01668919069414256149, 1e-13,
#        "iauStarpm", "ra", status);
#    @test isapprox(dec2, -1.093966454217127897, 1e-13,
#        "iauStarpm", "dec", status);
#    @test isapprox(pmr2, -0.1783662682153176524e-4, 1e-17,
#        "iauStarpm", "pmr", status);
#    @test isapprox(pmd2, 0.2338092915983989595e-5, 1e-17,
#        "iauStarpm", "pmd", status);
#    @test isapprox(px2, 0.7473533835317719243, 1e-13,
#        "iauStarpm", "px", status);
#    @test isapprox(rv2, -21.59905170476417175, 1e-11,
#        "iauStarpm", "rv", status);

#    viv(j, 0, "iauStarpm", "j", status);
# end

# let
#    double ra, dec, pmr, pmd, px, rv, pv[2][3];
#    int j;


#    ra =   0.01686756;
#    dec = -1.093989828;
#    pmr = -1.78323516e-5;
#    pmd =  2.336024047e-6;
#    px =   0.74723;
#    rv = -21.6;

#    j = iauStarpv(ra, dec, pmr, pmd, px, rv, pv);

#    @test isapprox(pv[0][0], 126668.5912743160601, 1e-10,
#        "iauStarpv", "11", status);
#    @test isapprox(pv[0][1], 2136.792716839935195, 1e-12,
#        "iauStarpv", "12", status);
#    @test isapprox(pv[0][2], -245251.2339876830091, 1e-10,
#        "iauStarpv", "13", status);

#    @test isapprox(pv[1][0], -0.4051854008955659551e-2, 1e-13,
#        "iauStarpv", "21", status);
#    @test isapprox(pv[1][1], -0.6253919754414777970e-2, 1e-15,
#        "iauStarpv", "22", status);
#    @test isapprox(pv[1][2], 0.1189353714588109341e-1, 1e-13,
#        "iauStarpv", "23", status);

#    viv(j, 0, "iauStarpv", "j", status);
# end

# let
#    double s, p[3], sp[3];


#    s = 2.0;

#    p[0] =  0.3;
#    p[1] =  1.2;
#    p[2] = -2.5;

#    iauSxp(s, p, sp);

#    @test isapprox(sp[0],  0.6, 0.0, "iauSxp", "1", status);
#    @test isapprox(sp[1],  2.4, 0.0, "iauSxp", "2", status);
#    @test isapprox(sp[2], -5.0, 0.0, "iauSxp", "3", status);
# end


# let
#    double s, pv[2][3], spv[2][3];


#    s = 2.0;

#    pv[0][0] =  0.3;
#    pv[0][1] =  1.2;
#    pv[0][2] = -2.5;

#    pv[1][0] =  0.5;
#    pv[1][1] =  3.2;
#    pv[1][2] = -0.7;

#    iauSxpv(s, pv, spv);

#    @test isapprox(spv[0][0],  0.6, 0.0, "iauSxpv", "p1", status);
#    @test isapprox(spv[0][1],  2.4, 0.0, "iauSxpv", "p2", status);
#    @test isapprox(spv[0][2], -5.0, 0.0, "iauSxpv", "p3", status);

#    @test isapprox(spv[1][0],  1.0, 0.0, "iauSxpv", "v1", status);
#    @test isapprox(spv[1][1],  6.4, 0.0, "iauSxpv", "v2", status);
#    @test isapprox(spv[1][2], -1.4, 0.0, "iauSxpv", "v3", status);
# end

# let
#    double t1, t2;
#    int j;


#    j = iauTaitt(2453750.5, 0.892482639, &t1, &t2);

#    @test isapprox(t1, 2453750.5, 1e-6, "iauTaitt", "t1", status);
#    @test isapprox(t2, 0.892855139, 1e-12, "iauTaitt", "t2", status);
#    viv(j, 0, "iauTaitt", "j", status);
# end

# let
#    double u1, u2;
#    int j;


#    j = iauTaiut1(2453750.5, 0.892482639, -32.6659, &u1, &u2);

#    @test isapprox(u1, 2453750.5, 1e-6, "iauTaiut1", "u1", status);
#    @test isapprox(u2, 0.8921045614537037037, 1e-12, "iauTaiut1", "u2", status);
#    viv(j, 0, "iauTaiut1", "j", status);
# end

# let
#    double u1, u2;
#    int j;


#    j = iauTaiutc(2453750.5, 0.892482639, &u1, &u2);

#    @test isapprox(u1, 2453750.5, 1e-6, "iauTaiutc", "u1", status);
#    @test isapprox(u2, 0.8921006945555555556, 1e-12, "iauTaiutc", "u2", status);
#    viv(j, 0, "iauTaiutc", "j", status);
# end

# let
#    double b1, b2;
#    int j;


#    j = iauTcbtdb(2453750.5, 0.893019599, &b1, &b2);

#    @test isapprox(b1, 2453750.5, 1e-6, "iauTcbtdb", "b1", status);
#    @test isapprox(b2, 0.8928551362746343397, 1e-12, "iauTcbtdb", "b2", status);
#    viv(j, 0, "iauTcbtdb", "j", status);
# end

# let
#    double t1, t2;
#    int j;


#    j = iauTcgtt(2453750.5, 0.892862531, &t1, &t2);

#    @test isapprox(t1, 2453750.5, 1e-6, "iauTcgtt", "t1", status);
#    @test isapprox(t2, 0.8928551387488816828, 1e-12, "iauTcgtt", "t2", status);
#    viv(j, 0, "iauTcgtt", "j", status);
# end

# let
#    double b1, b2;
#    int j;


#    j = iauTdbtcb(2453750.5, 0.892855137, &b1, &b2);

#    @test isapprox( b1, 2453750.5, 1e-6, "iauTdbtcb", "b1", status);
#    @test isapprox( b2, 0.8930195997253656716, 1e-12, "iauTdbtcb", "b2", status);
#    viv(j, 0, "iauTdbtcb", "j", status);
# end

# let
#    double t1, t2;
#    int j;


#    j = iauTdbtt(2453750.5, 0.892855137, -0.000201, &t1, &t2);

#    @test isapprox(t1, 2453750.5, 1e-6, "iauTdbtt", "t1", status);
#    @test isapprox(t2, 0.8928551393263888889, 1e-12, "iauTdbtt", "t2", status);
#    viv(j, 0, "iauTdbtt", "j", status);
# end

# let
#    double a;
#    int j;


#    j = iauTf2a('+', 4, 58, 20.2, &a);

#    @test isapprox(a, 1.301739278189537429, 1e-12, "iauTf2a", "a", status);
#    viv(j, 0, "iauTf2a", "j", status);
# end

# let
#    double d;
#    int j;


#    j = iauTf2d(' ', 23, 55, 10.9, &d);

#    @test isapprox(d, 0.9966539351851851852, 1e-12, "iauTf2d", "d", status);
#    viv(j, 0, "iauTf2d", "j", status);
# end

# let
#    double xi, eta, ra, dec, az1, bz1, az2, bz2;
#    int n;


#    xi = -0.03;
#    eta = 0.07;
#    ra = 1.3;
#    dec = 1.5;

#    n = iauTpors(xi, eta, ra, dec, &az1, &bz1, &az2, &bz2);

#    @test isapprox(az1, 1.736621577783208748, 1e-13, "iauTpors", "az1", status);
#    @test isapprox(bz1, 1.436736561844090323, 1e-13, "iauTpors", "bz1", status);

#    @test isapprox(az2, 4.004971075806584490, 1e-13, "iauTpors", "az2", status);
#    @test isapprox(bz2, 1.565084088476417917, 1e-13, "iauTpors", "bz2", status);

#    viv(n, 2, "iauTpors", "n", status);
# end

# let
#    double xi, eta, ra, dec, v[3], vz1[3], vz2[3];
#    int n;


#    xi = -0.03;
#    eta = 0.07;
#    ra = 1.3;
#    dec = 1.5;
#    iauS2c(ra, dec, v);

#    n = iauTporv(xi, eta, v, vz1, vz2);

#    @test isapprox(vz1[0], -0.02206252822366888610, 1e-15,
#        "iauTporv", "x1", status);
#    @test isapprox(vz1[1], 0.1318251060359645016, 1e-14,
#        "iauTporv", "y1", status);
#    @test isapprox(vz1[2], 0.9910274397144543895, 1e-14,
#        "iauTporv", "z1", status);

#    @test isapprox(vz2[0], -0.003712211763801968173, 1e-16,
#        "iauTporv", "x2", status);
#    @test isapprox(vz2[1], -0.004341519956299836813, 1e-16,
#        "iauTporv", "y2", status);
#    @test isapprox(vz2[2], 0.9999836852110587012, 1e-14,
#        "iauTporv", "z2", status);

#    viv(n, 2, "iauTporv", "n", status);
# end

# let
#    double xi, eta, raz, decz, ra, dec;


#    xi = -0.03;
#    eta = 0.07;
#    raz = 2.3;
#    decz = 1.5;

#    iauTpsts(xi, eta, raz, decz, &ra, &dec);

#    @test isapprox(ra, 0.7596127167359629775, 1e-14, "iauTpsts", "ra", status);
#    @test isapprox(dec, 1.540864645109263028, 1e-13, "iauTpsts", "dec", status);
# end

# let
#    double xi, eta, raz, decz, vz[3], v[3];


#    xi = -0.03;
#    eta = 0.07;
#    raz = 2.3;
#    decz = 1.5;
#    iauS2c(raz, decz, vz);

#    iauTpstv(xi, eta, vz, v);

#    @test isapprox(v[0], 0.02170030454907376677, 1e-15, "iauTpstv", "x", status);
#    @test isapprox(v[1], 0.02060909590535367447, 1e-15, "iauTpstv", "y", status);
#    @test isapprox(v[2], 0.9995520806583523804, 1e-14, "iauTpstv", "z", status);
# end

# let
#    double ra, dec, raz, decz, xi, eta;
#    int j;


#    ra = 1.3;
#    dec = 1.55;
#    raz = 2.3;
#    decz = 1.5;

#    j = iauTpxes(ra, dec, raz, decz, &xi, &eta);

#    @test isapprox(xi, -0.01753200983236980595, 1e-15, "iauTpxes", "xi", status);
#    @test isapprox(eta, 0.05962940005778712891, 1e-15, "iauTpxes", "eta", status);

#    viv(j, 0, "iauTpxes", "j", status);
# end

# let
#    double ra, dec, raz, decz, v[3], vz[3], xi, eta;
#    int j;


#    ra = 1.3;
#    dec = 1.55;
#    raz = 2.3;
#    decz = 1.5;
#    iauS2c(ra, dec, v);
#    iauS2c(raz, decz, vz);

#    j = iauTpxev(v, vz, &xi, &eta);

#    @test isapprox(xi, -0.01753200983236980595, 1e-15, "iauTpxev", "xi", status);
#    @test isapprox(eta, 0.05962940005778712891, 1e-15, "iauTpxev", "eta", status);

#    viv(j, 0, "iauTpxev", "j", status);
# end

# let
#    double r[3][3], rt[3][3];


#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    iauTr(r, rt);

#    @test isapprox(rt[0][0], 2.0, 0.0, "iauTr", "11", status);
#    @test isapprox(rt[0][1], 3.0, 0.0, "iauTr", "12", status);
#    @test isapprox(rt[0][2], 3.0, 0.0, "iauTr", "13", status);

#    @test isapprox(rt[1][0], 3.0, 0.0, "iauTr", "21", status);
#    @test isapprox(rt[1][1], 2.0, 0.0, "iauTr", "22", status);
#    @test isapprox(rt[1][2], 4.0, 0.0, "iauTr", "23", status);

#    @test isapprox(rt[2][0], 2.0, 0.0, "iauTr", "31", status);
#    @test isapprox(rt[2][1], 3.0, 0.0, "iauTr", "32", status);
#    @test isapprox(rt[2][2], 5.0, 0.0, "iauTr", "33", status);
# end

# let
#    double r[3][3], p[3], trp[3];


#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    p[0] = 0.2;
#    p[1] = 1.5;
#    p[2] = 0.1;

#    iauTrxp(r, p, trp);

#    @test isapprox(trp[0], 5.2, 1e-12, "iauTrxp", "1", status);
#    @test isapprox(trp[1], 4.0, 1e-12, "iauTrxp", "2", status);
#    @test isapprox(trp[2], 5.4, 1e-12, "iauTrxp", "3", status);
# end

# let
#    double r[3][3], pv[2][3], trpv[2][3];


#    r[0][0] = 2.0;
#    r[0][1] = 3.0;
#    r[0][2] = 2.0;

#    r[1][0] = 3.0;
#    r[1][1] = 2.0;
#    r[1][2] = 3.0;

#    r[2][0] = 3.0;
#    r[2][1] = 4.0;
#    r[2][2] = 5.0;

#    pv[0][0] = 0.2;
#    pv[0][1] = 1.5;
#    pv[0][2] = 0.1;

#    pv[1][0] = 1.5;
#    pv[1][1] = 0.2;
#    pv[1][2] = 0.1;

#    iauTrxpv(r, pv, trpv);

#    @test isapprox(trpv[0][0], 5.2, 1e-12, "iauTrxpv", "p1", status);
#    @test isapprox(trpv[0][1], 4.0, 1e-12, "iauTrxpv", "p1", status);
#    @test isapprox(trpv[0][2], 5.4, 1e-12, "iauTrxpv", "p1", status);

#    @test isapprox(trpv[1][0], 3.9, 1e-12, "iauTrxpv", "v1", status);
#    @test isapprox(trpv[1][1], 5.3, 1e-12, "iauTrxpv", "v2", status);
#    @test isapprox(trpv[1][2], 4.1, 1e-12, "iauTrxpv", "v3", status);
# end

# let
#    double a1, a2;
#    int j;


#    j = iauTttai(2453750.5, 0.892482639, &a1, &a2);

#    @test isapprox(a1, 2453750.5, 1e-6, "iauTttai", "a1", status);
#    @test isapprox(a2, 0.892110139, 1e-12, "iauTttai", "a2", status);
#    viv(j, 0, "iauTttai", "j", status);
# end

# let
#    double g1, g2;
#    int j;


#    j = iauTttcg(2453750.5, 0.892482639, &g1, &g2);

#    @test isapprox( g1, 2453750.5, 1e-6, "iauTttcg", "g1", status);
#    @test isapprox( g2, 0.8924900312508587113, 1e-12, "iauTttcg", "g2", status);
#    viv(j, 0, "iauTttcg", "j", status);
# end

# let
#    double b1, b2;
#    int j;


#    j = iauTttdb(2453750.5, 0.892855139, -0.000201, &b1, &b2);

#    @test isapprox(b1, 2453750.5, 1e-6, "iauTttdb", "b1", status);
#    @test isapprox(b2, 0.8928551366736111111, 1e-12, "iauTttdb", "b2", status);
#    viv(j, 0, "iauTttdb", "j", status);
# end

# let
#    double u1, u2;
#    int j;


#    j = iauTtut1(2453750.5, 0.892855139, 64.8499, &u1, &u2);

#    @test isapprox(u1, 2453750.5, 1e-6, "iauTtut1", "u1", status);
#    @test isapprox(u2, 0.8921045614537037037, 1e-12, "iauTtut1", "u2", status);
#    viv(j, 0, "iauTtut1", "j", status);
# end

# let
#    double a1, a2;
#    int j;


#    j = iauUt1tai(2453750.5, 0.892104561, -32.6659, &a1, &a2);

#    @test isapprox(a1, 2453750.5, 1e-6, "iauUt1tai", "a1", status);
#    @test isapprox(a2, 0.8924826385462962963, 1e-12, "iauUt1tai", "a2", status);
#    viv(j, 0, "iauUt1tai", "j", status);
# end

# let
#    double t1, t2;
#    int j;


#    j = iauUt1tt(2453750.5, 0.892104561, 64.8499, &t1, &t2);

#    @test isapprox(t1, 2453750.5, 1e-6, "iauUt1tt", "t1", status);
#    @test isapprox(t2, 0.8928551385462962963, 1e-12, "iauUt1tt", "t2", status);
#    viv(j, 0, "iauUt1tt", "j", status);
# end

# let
#    double u1, u2;
#    int j;


#    j = iauUt1utc(2453750.5, 0.892104561, 0.3341, &u1, &u2);

#    @test isapprox(u1, 2453750.5, 1e-6, "iauUt1utc", "u1", status);
#    @test isapprox(u2, 0.8921006941018518519, 1e-12, "iauUt1utc", "u2", status);
#    viv(j, 0, "iauUt1utc", "j", status);
# end

# let
#    double u1, u2;
#    int j;


#    j = iauUtctai(2453750.5, 0.892100694, &u1, &u2);

#    @test isapprox(u1, 2453750.5, 1e-6, "iauUtctai", "u1", status);
#    @test isapprox(u2, 0.8924826384444444444, 1e-12, "iauUtctai", "u2", status);
#    viv(j, 0, "iauUtctai", "j", status);
# end

# let
#    double u1, u2;
#    int j;


#    j = iauUtcut1(2453750.5, 0.892100694, 0.3341, &u1, &u2);

#    @test isapprox(u1, 2453750.5, 1e-6, "iauUtcut1", "u1", status);
#    @test isapprox(u2, 0.8921045608981481481, 1e-12, "iauUtcut1", "u2", status);
#    viv(j, 0, "iauUtcut1", "j", status);
# end

# let
#    double x, y;


#    iauXy06(2400000.5, 53736.0, &x, &y);

#    @test isapprox(x, 0.5791308486706010975e-3, 1e-15, "iauXy06", "x", status);
#    @test isapprox(y, 0.4020579816732958141e-4, 1e-16, "iauXy06", "y", status);
# end

# let
#    double x, y, s;


#    iauXys00a(2400000.5, 53736.0, &x, &y, &s);

#    @test isapprox(x,  0.5791308472168152904e-3, 1e-14, "iauXys00a", "x", status);
#    @test isapprox(y,  0.4020595661591500259e-4, 1e-15, "iauXys00a", "y", status);
#    @test isapprox(s, -0.1220040848471549623e-7, 1e-18, "iauXys00a", "s", status);
# end

# let
#    double x, y, s;


#    iauXys00b(2400000.5, 53736.0, &x, &y, &s);

#    @test isapprox(x,  0.5791301929950208873e-3, 1e-14, "iauXys00b", "x", status);
#    @test isapprox(y,  0.4020553681373720832e-4, 1e-15, "iauXys00b", "y", status);
#    @test isapprox(s, -0.1220027377285083189e-7, 1e-18, "iauXys00b", "s", status);
# end

# let
#    double x, y, s;


#    iauXys06a(2400000.5, 53736.0, &x, &y, &s);

#    @test isapprox(x,  0.5791308482835292617e-3, 1e-14, "iauXys06a", "x", status);
#    @test isapprox(y,  0.4020580099454020310e-4, 1e-15, "iauXys06a", "y", status);
#    @test isapprox(s, -0.1220032294164579896e-7, 1e-18, "iauXys06a", "s", status);
# end

# let
#    double p[3];


#    p[0] =  0.3;
#    p[1] =  1.2;
#    p[2] = -2.5;

#    iauZp(p);

#    @test isapprox(p[0], 0.0, 0.0, "iauZp", "1", status);
#    @test isapprox(p[1], 0.0, 0.0, "iauZp", "2", status);
#    @test isapprox(p[2], 0.0, 0.0, "iauZp", "3", status);
# end

# let
#    double pv[2][3];


#    pv[0][0] =  0.3;
#    pv[0][1] =  1.2;
#    pv[0][2] = -2.5;

#    pv[1][0] = -0.5;
#    pv[1][1] =  3.1;
#    pv[1][2] =  0.9;

#    iauZpv(pv);

#    @test isapprox(pv[0][0], 0.0, 0.0, "iauZpv", "p1", status);
#    @test isapprox(pv[0][1], 0.0, 0.0, "iauZpv", "p2", status);
#    @test isapprox(pv[0][2], 0.0, 0.0, "iauZpv", "p3", status);

#    @test isapprox(pv[1][0], 0.0, 0.0, "iauZpv", "v1", status);
#    @test isapprox(pv[1][1], 0.0, 0.0, "iauZpv", "v2", status);
#    @test isapprox(pv[1][2], 0.0, 0.0, "iauZpv", "v3", status);
# end

# let
#    double r[3][3];


#    r[0][0] = 2.0;
#    r[1][0] = 3.0;
#    r[2][0] = 2.0;

#    r[0][1] = 3.0;
#    r[1][1] = 2.0;
#    r[2][1] = 3.0;

#    r[0][2] = 3.0;
#    r[1][2] = 4.0;
#    r[2][2] = 5.0;

#    iauZr(r);

#    @test isapprox(r[0][0], 0.0, 0.0, "iauZr", "00", status);
#    @test isapprox(r[1][0], 0.0, 0.0, "iauZr", "01", status);
#    @test isapprox(r[2][0], 0.0, 0.0, "iauZr", "02", status);

#    @test isapprox(r[0][1], 0.0, 0.0, "iauZr", "10", status);
#    @test isapprox(r[1][1], 0.0, 0.0, "iauZr", "11", status);
#    @test isapprox(r[2][1], 0.0, 0.0, "iauZr", "12", status);

#    @test isapprox(r[0][2], 0.0, 0.0, "iauZr", "20", status);
#    @test isapprox(r[1][2], 0.0, 0.0, "iauZr", "21", status);
#    @test isapprox(r[2][2], 0.0, 0.0, "iauZr", "22", status);
# end