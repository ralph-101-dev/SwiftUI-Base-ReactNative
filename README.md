# SwiftUI-Base-ReactNative

## Motivation

React Native는 모든 화면전환에 관련된 흐름을 React Native Navigation을 사용해 내부적으로 관리하고 있다.

진입점이 되는 하나의 ViewController(Activity)를 기준으로 RootView를 생성하고 이후에 추가되는 스크린들을 SubViewController(Fragment)로서 관리한다.

따라서 순수하게 Native로 구성된 스크린을 React Native 스크린들 사이에서 자연스럽게 사용하는 것은 구조적인 어려움이 있다.

따라서 화면전환에 관련된 처리를 Native 수준에서 관리하고자 한다.


Native Base App은 모든 스크린들을 Native 스크린(ViewController(View)/Activity)으로 가정하고 화면을 전환하게 된다.

각 스크린은 React Native View를 사용하거나 Native View를 사용해 구성할 수 있다.

React Native를 사용하는 ViewController(View)는 RCTRootView를 가지게 되고, React Native에서 등록한 모듈을 그려 사용하게 된다.

Mobile device hardware handling이나 Performance 혹은 기타 이유로 필요에 따라 ViewController(View)를 유연하게 추가해 사용할 수 있다.

## Structure

<img width=1024 src="https://user-images.githubusercontent.com/49086747/264961034-33947a50-5836-4d24-8073-f247a81fb49f.png">

## How to run

```shell
# root
# install packages
yarn install

# ios directory
# install pods
cd ios
pod install

# root
# start bundler(metro) and build ios
yarn ios
```

## Demo

https://github.com/ralph-101-dev/SwiftUI-Base-ReactNative/assets/49086747/13f9fdd0-f685-44ba-8244-fa815e6a7177

---
## Reference

[Replacing an iOS project in React Native with a SwiftUI project](https://gist.github.com/ralph-101-dev/c606dc4b4e422b9ce8ab137928615311)
