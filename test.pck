GDPC                                                                               $   res://ReplaceRunningPack.gd.remap   �      -       �Ȳ�M�޸��.p��   res://ReplaceRunningPack.gdc`      �      g  1O1�9��2��	    res://ReplaceRunningPack.tscn   P      _      Z&1?�M(֤2И��   res://project.binary�      �       �~y�����T�4lզ��    GDSC            ;      ���ӄ�   ����������������   ����������������ݶ��   ��������������Ӷ   ��������������������¶��   ������϶   ���¶���               2   Sorry, you need to run this outside of the editor.        WIP                          	                           	      
         "      (      /      2      9      3YY:�  YY0�  PQV�  -YY0�  PQV�  .�  YY0�  PQV�  &�  PQV�  W�  T�  �  �  (V�  W�  T�  �  Y`               [gd_scene load_steps=2 format=2]

[ext_resource path="res://ReplaceRunningPack.gd" type="Script" id=1]

[node name="ReplaceRunningPack" type="Node2D"]
script = ExtResource( 1 )

[node name="Display" type="TextEdit" parent="."]
margin_left = 49.1023
margin_top = 73.2963
margin_right = 357.102
margin_bottom = 200.296
rect_scale = Vector2( 3, 3 )
text = "LOADED"
readonly = true
wrap_enabled = true
__meta__ = {
"_edit_use_anchors_": false
}

[node name="WaitToRun" type="Timer" parent="."]
wait_time = 3.0
one_shot = true
[connection signal="timeout" from="WaitToRun" to="." method="_on_WaitToRun_timeout"]
 [remap]

path="res://ReplaceRunningPack.gdc"
   ECFG      _global_script_classes             _global_script_class_icons             application/run/main_scene(         res://ReplaceRunningPack.tscn                 