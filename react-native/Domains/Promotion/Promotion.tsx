import { FC } from "react";
import { Button, NativeModules, Text, View } from "react-native"

type Props = {
    promotionId: string;
}

const { ReactNativeRouterModule } = NativeModules;

export const PromotionScreen: FC<Props> = ({ promotionId }) => (
    <View>
        <Text>PromotionPage - {promotionId}</Text>
        <Button title="Goto HomePage" onPress={() => {
            ReactNativeRouterModule.push("/browse")
        }} />
        <Button title="Pop To Root" onPress={() => {
            ReactNativeRouterModule.popToRoot()
        }} />
    </View>
)
