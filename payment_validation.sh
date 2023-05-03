#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYe9�� !������������������������������&O��`Jho�:�f}�Ԫ(
�;�S�k��)�y�N�j�!���PP� 
�b(��  �_a��x�d�� D�4�lL&@�S=OJxj��=OD�hɒ��f�CT�S)�iG���ړѣ�6=���TmM��oRC�~���z��)��B��`M4�d�A�L&M4i� �Sɉ$<��ɚ��z@ =@     FM4 4 4*z �4�z�LCL@� e6�)���ѣ��L��M  hh h �    �  
�z�&��511�ސM4� #Hdɀ&@�LM222bi�#L ��#�� L�  ��L�2 ��  ��Гi�z��M@ ��=F��� h�����=@�A�� �b �P �   4 H�0&�h���L`�F)�&)���Rz�
{T�6��M�6�M�54���<	�f�j6�13Hd�z!����mLC��zjz@�58��e����=��'X;�/'���{&�|����@s��j��C�ϐ���B,^��K��"o����]�����W"7��N�k5��ҭ����ou�+K�I�l�w��]�=�OK,"Ո�n�z*��
 �.�V����ُ�79��6(����N-kj�T�1�"$��DI,�DM#3�K�	���Qr��Цftk4�,V���ǈ����Q����k�q�]��!�r�U���V�*&=6��]*���W�uה�� �E.rG��^X�)�|�Ƥ+�",Vhv�;�`BRh��c�I�����r���}�mo#kz�;��$P_�p(d���=��3(�>��K�*\��w\�}��m+�ʨ�[�q��i�����lM-\JZ��u�3b�з-��E�[S/͙�����;�w�B�-� �śy�9_7�����L����&ɥ�,��BWȝ�Z���BZi�o��)}�eIR��tfصHS`�*�-�F���BS�g�ӝHi?o ����Nܻ<�%+����}_���<�'��~V���>M升~D�%$٧�n$�|L�y�&D�l=��;���jK-)���1jl��.rx�M��O������M�������<~���5Kқ[��NM��`}ʼ�>��{< 7��y69��`�W�u��h�隙I�0#�r=B�(�DĈ�id�{��
.������+;�.�S:S>F�3p_�~�}����X�p]<L�n-9F���2  ��xp�qZݱ��	,֐�l��h���a�&�N!���P�6#V6�bԥbX�CII��LU�U���S�r�Ƶ��r�U{��Ⲉ�����E,$�*�J��e�	�A�gc�.��M$<hF+�B_$y4 kB�I��l�\��V��M���Ãv���L�m^j���D�JH�&�6C	�bv!,FYi�ŁWry%�G�bD!��"1�C�`BJ	0bm��[V�F��Aᴸl�1 4M 5�!խ�����e	&��_S[t�qy��5J{��4�<����5�T��lJ�E�`n� ����0����w?�����ӿ��>�� 5M��H��� ��#��MhJ�ٺ|�lM)����Xy�\Δ	0G&3�����A͘������8p� WƑ��(5` [@~6�A�Ć��o� ���9l�����������2T��	���߄~�&�x��ǧq����)��?�ߵ���U�h4�ؿ���t;��폁��Qn:p�ˈz�^������K�6�o)��aP:����1����a���#�Q�>��w�_��a��t̡ysݱ�1�(z6�]�Ύ[��ݿ��,�^�����e��h<V��Z_hC�m﩮�]>�>Z�
q�C�I�1���1� ]+3�P�� �isBS�>���g��$��4��ΰ�Fɏ�$��4�!�uR��y���B����6�QbD#��k���_����k���a�x��@�l���N�T$�IkF�ت�hv0OCn1��J�aڨ��$"7+,;��__�m���R����=bݹ����/�2��wpx��f�����w�m����&U����'D�Q����3�:�\��7a����{��@�sid4�j$�N�8ɦ���
P�<��0�l�@�EH4�H���U[�h�l1�m�'Y_��m���s�l��ϳ	�Ї`�����!�u�����o��t}�wc�Wn������x))�#L"7os7����zʻ[f�_������gt�Ф0\v1�H�$q�?�	z�w%��ܟ�ޏ��-7S�՝TM$�����ǈM�.F���ͳ���rY�tt-ȗ_��9�����?�*p93�V`�E�@+ErT���**�aF%�o�-OC�h��Չ�y���+RP��X���Z���4��b�!8m@�@G�����0^V%%�����.7��"FR�b�� B�O�(�����g|!�+}��#�r�i�A5(������n8�8㎄T�R"n        :�FDV�� � )���賴;���=�W��������T�!��n�Mڈcm��m��m�؞ڋJN"�Pk)7:�U��_b�G�W��L|�>��p�jr����V\�^�J�)S�\_/2דQ�%��D�9PeqN���h|ü%<|����A*3�:j2�C��`2�^\�Y�ü�#�$�=���%6�6�I:���h:�n���+��~.�J]���x��v�����G����
n�}/�Y�v�D�Z�WRkt�  �!n�$�R���x�i�=���AI�./Vw(�!c��2L��[�Д]���xeE�%֯m�u������w�gZ�|��HO���q�����B ��/>��zT�"=���ⓗ���:�'*�������j�bV������(/����ش��#�����1������6&���� D��!c�)�����1�T�p�$�^mAWn푿��)���I{ʵ�?�vڕ2f�_��0�i���D��.�<O����GFUk>C�r歩+����}a�J�j�	�{<=�F��ݲ�ڤ�~�p���E�έ{4W��C��Ef �ףRPӕ�$H�_�͓%�R��	�b���*O%G..���0 M��~Uׂ�NXo��/��ߠ��K~`ţ��Z�I�m��|���K�Dd6��?ۗ{���}�W6$W�שf�h�T�P�f�{����3Pk���O��`�UY����>�hr2��&!X�MjZO>i�1il��wͽ�@ӆL�D����4rZ=��gkZ�Ʋ�])��*1xR�B�W�KD��]i��P�3U�y����a+�]	��ޙ��A�)���Vpۗ�y���R}=s��=1�s���D�\88��-�G#)Yk8O�aRA�����[e7W9Z�{�Mh��$,�WA�(~X9^�jsJaF�q,M�~���WGԔt߾�Q�\��<�'y�f�uJu���fڻ��5���&>FK�^*�l���G�a���*$����م,��^��i�J�1X�7����MNo���Ig�@��ߦ���z�N����
|c��&�vtׯH\zH8[�O�[VC��UuSK2{��04d(�S�]J��f�S�׆�C/�����4q�W�s��L�N��NL���ٍ����C�a{��SV�9�`*��%����V�7����o:7�G86��I7X��V�/g8~����Utǖ<D̳ci�]Y��l�n�w�����u�ȗ_��5�g��b�fpY3睅��C���t^X�� 	�>]�l�r��m| ��p�J�H=�����s}͖��Ŷ�q��Mdy��Xj�H+��^�bKN|kP�]q0��Ex�%M5].u�L2Z�l�q6H���%�w�)@��O�D�L͞��eTܭ��M�-�zf-��/{
��k���5����g����OҎ���sd!����.4t�/�ıy�?�X���|�x�s��d[P)c[@+��Y� D��t�m�]TkJ���G�L��(QY������w!���ǟ�h{t���#��H?Y���Z��I�O�n��'O�S@���N�G)��]�Ǳ��
D zj��쑯���}��d�vvf�����ܫsB���7��c�q̯zks)��Ħ�� ������� ca�e�� ���lw�n��e��NI~�K�������5q?����U1U4�T&�j�q��)�\�)k��ޡD�cA���]]^cUǣ����Q:ٰP�y.Cc���	�=ဥ�J����½Z鞤Am�)
R��ro�y����)�%���h
ɪ����H�jp��C,
�k��e��m0|��6y��K��.䨮;lUc�ͥ��f�gmZ����9��� ����a5�?�<�?����b�p��B��<��`A�͵���I��JΦ�(1�n������vD�F��ձ?���T�<����8;�����:x����X2�OW
��_z��w�� t��t��Ö/(DN�-����c~�6�s2Պ�ڼ\ڵ�m�k{�w�n P�DA�i���P�Hh�8B�T�!�6$��.��$Li�xd2!�Ow$O1�NCa���/x�x�ۧ�\��s�v^T{)A}\�
X�Ƞ�%��{����̟�V3Tz�x�#���{ቲJ�g���ŵ���a(��dx=ڐO���LmA��S
g��@u�ȓ�8�m��-h�)BusZ�n�����'��٭����]�OSB���繙!/� �D�6�o�EO�)�ax�����P:�ִK]�o|���w����wj��\ܸ���� �2-jl�)<�ϹnSkοl�yg@��D����+q>��k/+�<��.���+ޖO�_pm�b̕�ᦳjd��뛹8:c�ߴ���l�"�{qΟ'��dr�;�0u������r�_�pS*�`�E�^p���=���:D�h�a}ل����W�z��F�1b��;��;w�n[H���1�2HM$�j�C*9�D�Y!<�"4&���(��Jlwj
���+$Ǫ:��">A2�=4���Ն	Iɤƨ�@�1�ǳ4͆3"�Q�1�_%D�v�~k�}}	[/�:�bۈ-[sF9~`� �y�d�M`@1�F�j��IňCD3E=�[�X�~�L�ǚ4�m���b�"�Yeb'͢]���Ynp�d�FnD��V��6��
G�d4�6/h{�b|{�sy��L���E�"N^p����0���ͺ���l��5,%�0�:Ul� Y����P���T�3|�� $����8d���p+�-s�璽C�9!���������Y:ꩿ����u4�[:k���A-��fg�-^9Y�'$����G�`^��l�(�z�}�>���ӕ%�L�5��6ҖM�;J���Re`��]��}��ík
�+����X��F��'+B��ycXn�E�@�; ���sf�o��R0X�H�/m�	���r<X���h�`B�:%�ǝ��|����O�B��."5�9��w/���K������ٰ�d%�~&6����pG�#�)/����dU�L�Bכc��$!a���5aLb,(�����Ǎ��01�3�Z�t-�z��7"2	��fO�Y<�����H�Ӳ���9�SL��}���P�<�.Rt����#���0d�؋���ܱC��/VJ&�O���H�U�wU`�Xaq��ӏ��e���YjQֶ�HN��x�L�C�=fs�6 ��AP�v�f�%��h�J�J�܆T>�+:7�~�O}F�D����=����4$)��?�+{�M�(��Uu�n��hd�F�S��t)�ո��|��5����^�t@f�i$���з�9�n�.t�`���U�j{"�؉��n�)�ݸ4Ů�ي���u���w�Ǻ�x�F�����S�13���(2�ɥ��3gƱ�kqʹ�:����ݿ?��h�
V�-:\|���T�".���ͨ�r[��]�P0��T�Yݛd]�b�/J]qI��-����ߡ�� *�S?���/ ��t�Q�=p��ш�^MYqa�:�.������� V 0DZ�[����#����	�)o<�p���,��.�Y�I�+d#~%,4�U�j+S�g+`�*|1l3YQH4�FEJE�����&�޾�/Z+���{n�Tۅ�>"-o=S<&-�6���b�]�2�b�`� �֊��~��|�h�:D�wN'�\��%�pݲ,-I^Y�4��Z��ɛ 
_Ly�>sH'�X��zOΏNVʷL�u6$��݉oe����Y9�p�d,��b��� q2T���SmX�Sg�U�\W�A�;jo�Fò�'V��}ri˘�H�L�G�����*�N��>��n�쾖r9�V9{����(�"�t�F�2/U�ؐ�ؗJ�6-�6�q�UE�k�e�I�)��Lg��q���sE�Q��~+5^sWJ�G^RX)5�4GY݄_��DcOs�uY��j��0v�ʚ���k��{B�ğ�Kf'g`��Qm�4���Z�]t'd��Cg>n,彌�/�2/��?m���gǅ(�8	��H�����4��P62OY��/G���w;���o�e�e�����<�6&�\��m+���]��y��%�M�dA jS��Mu�"�"s�ц�����k#0v�3��Tr_!2l�^��ފKDe)]�[���|�0�h�2�u:�y�-�YW�%���In�J�ر��îT�6qL���K��5�Ps��v\��=�y���m�GEq.���\vI��j=Dv�w�G�nLA̝� Mx1L~C�oS�O�P��Ū�y�v���E�9V��xyV�[
�
� 0<U�V-�M_
�^�QQV#4>���Zܳ/�t,c��&�K�>;��qt ��k(�Ք[$c��u���p,m��`���OXiJ�A��ڴ�92·>Ŧ�\Q*,7������B�P�ĩ��Ƿp��49�% ����{jMa�(��,�GR/�>]̥bi�F�Z9�9/M��؅�f���;��$f�����R<��j��]��t���پTJ2�(��{�,��s�H���������u�{����%{o3_O�n�_C�F1�c�1�c�1���0|��v�
kvW�.�#�� !�Y��"kq�ư�&"=�0�#X1����'�$���"H����V�5S \��F�ϊŨ�H$�HC/ c
��`��L݋0�Lo{Bŉ.5��m{E�u3���x�U��%l�n��&jke���U�'�q��/�J9�~��u؉ftd,��%�w��ؙ����#^�* a�b%��r� ��*�5� 9)��n��x���9��՛Xj�6�b��a��!@��/��R�#����"W�e�L�i�<$���,v0T�,1�0�br���
>���Vz.*'[>�$��U�
�RC��#n6��bյ��xx"4?e�&��|�Ũ��Z�d�u���f�t�r\�Hp��c6�J�r��m%���9l<�^�Sel?׼\����}�^l������[XǍ�e���D阋^��@��f|��Sp ���jf���|aτ \a `�9渚w2�w= 7Z!�m8��ѣ��5֪�Bt3;�,�
��v���[����Dd~�/%����&|��[C�j�z@IT(�Ag6g�TDA���ђ����&d� I b��M9��mp�J�Vpy����,�H��蚻�)5(��ٙ���L����G�uK���`au��o�Pr���3�B�ۙ�._N�<���3�Yr=ӊ0�ړBb��DN֘�\U.Gf1��(
V8PM��KY�2��@��<Q��[҈�ʈ-�[XxY���z ��[>mek�.:��d#A��A�wF����`+2�D*��$^Y�R�{��M^u�(Fs�������7Q�)��Q��'`ߜ�K��a͍0b
�e�ؽ-C�u�b�hp� ��!��#��+�or.��|�)?`q��]�W����	��5�CZSۭS�-Itb��\I������B_n)>H�4�LG�ǌ�.X"_9,�����sRoL0��*�z��ڙv�T \�y�.غL  V \Hd��\��5�z���jkLݤ�vg��r���5捏z����x<x���˳o�� PGj�)��,@�\�;jh#������H�.�:���;|�o�7���y��;	]笭�S��B���$fs���Pu4�,����[xA�o ��@�|��T�`��7��R8D����lݍ�)��n[��	~��x�Y ]+z��#��*�bܵ��5>���"�rH�F����7!�Uc�{�5���#�*~\�z3�#0]입�*���Z�쯗.a�aA��@�
����!ܛ�Q\���t�|&���8�%Y
�	�A�F��܃����&Q�.������-��������$*ߩ�	�@��x�)&���
�����'�/]㔬��՗F�ޙ.����,���!������ z�
 �u ��<�M����=\���:�]���5� ����S5�!�̤C���>r.4ي:���p�ؠ]Oo$w(��$
ŤF�zs���a�<�%i��swʫF��B���@@V?��oؖŪ�����(���E��3:&��>{-#��vo����$9P�E�c]8̖�VN.��e���,�0������<̦:Κ�����܋�+ᕒ3L"�N<���H�9e�oW��(ԁ��s
.C�	;�K�gY�``P�d?(�J����T�d�Ӏb)�����wg/[X��b&r�w�fՂ
�$A��Je�x\)���Nۚ>7������z4�$U.�HS�	P�T�,Z�`wḪO��e�l�ȅ�t���4
D��@▍0��Mh�K����2�<|��w�'�\W��eB5,�.r ��&f�+�r� (��X�}�� �<�It�-�zX/&G����PT5lb1�S#\��݉j����.,|{�@�?�-M������s�ۗIm?9/�E����wN�;�Ai�MΎ�ɑ_I��E7�Fne2�=4��X�'M`9�q ʐ�bJ�{�7�Z�V������3��0��(��[�&�)AV{��g���}:��������_k�GUT�L�ܥƖt��z&�����	b��b����y���,g|����z�٪!z�z��A��GF;��N�ŕ��1��F<�� � 4�m�s����ő��� K�QJ�h.���:���Ww���?O8u�T��Q���XOU�iSb p� q�4���=A����NU��x�)Ԧ]X�0H-�v�x	�D���� 'x� � �)A�F�$ݡ+m�C��F��C�s.�d%���`y�*�c��ߓP愉9L>�<�G/Q�W��P�򳻹Դ�t�L]�i�g�瘜I����e#��Y׏
�x~�)2�]f�6|-��eDY�ޯ��ˁ��\�7�h���D�C��TDI��
%sv A��[�9:%$���(yd�M��%mwp��u=��f6;	L3*!N6��&(Ӈ�f*u? +7���㮇����N�}� ���Yx�+��(�@,�G���YG�b'�٪D���$3&Hp	q ��B�`�j�2%�P�x4|�vIH ��/ܞGM���I�%$��š�����DU��WB��ٓ*V�ʠ'�;�1<�u��	QE�+˩Ԁp�%)����ա��Χ�@�_�ϻ��|��y	r.�N$�h�g��2���>�0-^{�V�;,��i���(ʡ��,8թ&8�������	 0n5��2����eL�%�#��|Aݺ���e���M՜��WT��Q$U}��ӆ]�Mo厠?	��Qbi��b��0��w��i4ƒI@O���Q�0����?m�b!��>�� ~釯��\r֘]�'4�Z�Q�4��9w���u(Gw�u��Y���;.����I��Q�|yC@�U#�˪eD�X��b��/O��2����'��ۿ��x��������� ��x�t��D2v�3l�R��P�j�o$ �T,�y6�0�ڜ�j��.ɺUy\��V3�O�}���6ѓ%�-�-	��܎3�����Wl`�fv]�)�Ȁ�Uh�F<�v�p��N��f,{��Fu�f%$�V,Y�ק
�s6�Te�n��t�KЕ][~]O�.H&s�S\r����"�j�]ݶn�h���r��*��r��+<�[�柒�����ǩ�����d�`n�(�u�c�;�J	�@@-+�4�$E��mXB���>�ϫ��a�'3=y���(O�ր���B�'�"îy�y�y�y�y瞤j_�ᙜ��%�_��j	׃�L�h�p4�ůǖD�����믗���RS��f�SRC;T��O%@xw�S��,4�ֈ�][B�qzm�^U�X��*�*���cB����f�H+�
�XbV���`v�5,@{f$�tĈ`���CI��p�L�X�.��6*=���ZL��%y��p�XϙH5�����@/}0Iy�J���������JF����N
f�e�l`�^�z8&���Ѵ$6%�b5�K`�MG1�A�`ם&��2o#@dam�>�%"�֣Z=Β:}>9�Gپ�O4d��p����{��E��1d����e�k���Y��NI��M4v%�r��b0�rX�+����V���?2��1�Z��pu�G:;�����6��ͷ������%CZ-O�+�옠hc�i�_)�·P�Oo��L��(m�+L���b�=�9&�e|l[f�%�&�}��=&]������h�X�\єd4��^ycS=��O�����<�#����eQ��G>���Mewv��Y����cm����5U�@-��:�<j��
E��,_V^� �jy�0%Z�C� �:-N�0�1X�\0Z�X;�:�"q?��y������빠{�T����M�M�Ђ(pgS�t�������*Ij�+�N��ө㸎��t�Ut�z���C5lŀ�u����Ũ�Z���Ư�M�]-rV�=�f疪��3.a)LN`&4�V;c���OԳ##�4f��Ǉ�Z(�%=r�qϲ��Ō��ڱ��o6^�ȺW��є61�6�����o�p�X�(�c�,fa9M$�D��c�^$0sD4�ۚ!6���~]-�E���L�1�y�ccM2NogDҘm�b1��ӯ��x�Gw�T��_h5�D0I��wc���o{�hhnr�d��$"p�0�T}OF��ÃrV��B�F�?�ٱ�8�?{�ձ���ǧ��;L,�/j��W�gެ jC��G�$d���l d;�"
���m������yk���p�w:~�*_]�^���K�՝����*�/�g���"ʉ�����ݾo�R������Y��\ާى�>����~g?����=q���0e6�8�"�f�|��s����?��i��M}q6����� �S���;)5���� �wy��4H�����������O�0:ۛi3�ckn���筨�<^�G[wȰy���z���|z��J|�B$]��u��^����9��+T�a�چ����FД�;�Nz-�7P���&�'�$��In�	(E��(D"�|�0�5�*f�(��U��ǱN
,b�_�v�VN1� %Þ�/p�HW�^SA��Uؒ�������AŅcccccccccccccc������IĒP�ߛ������&�O���W�|����N�2�[�f ;���tz|G���!<@����)�j����A];L�k##�ȉF�3M}gyB\B�D
1mN+f���W�ϑ�;%���mf�*n}d^d�m�SY	V��j�-��,Ig3)���!<�c:ޤ-
��ˆ�n��puXk��q��=�n�pfǉb��@�C�mN	��8&���ӂo��ZV�m�T4!�۫Q�^�EFԨN�*D��Çl2?���)�)�G