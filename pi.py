from PIL import Image
import os

def compress_folder(folder,max_width=1200,quality=6):
    for name in os.listdir(folder):
        path=os.path.join(folder,name)
        if not os.path.isfile(path):
            continue
        if name.lower().endswith((".png",".jpg",".jpeg")):
            try:
                img=Image.open(path)
                # 如果图片过宽，等比例缩小
                if img.width>max_width:
                    img.thumbnail((max_width,9999))
                # 保存压缩，优化体积
                img.save(path,optimize=True)
                print("已压缩：",name)
            except Exception as e:
                print("跳过",name,e)

if __name__=="__main__":
    compress_folder("media/avatar")
    compress_folder("media/good_img",max_width=300,quality=7)