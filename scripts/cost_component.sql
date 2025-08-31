--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cost_component; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE cost_component (
    cost_component_id character varying(20) NOT NULL,
    cost_component_type_id character varying(20),
    product_id character varying(20),
    product_feature_id character varying(20),
    party_id character varying(20),
    geo_id character varying(20),
    work_effort_id character varying(20),
    fixed_asset_id character varying(20),
    cost_component_calc_id character varying(20),
    from_date timestamp with time zone,
    thru_date timestamp with time zone,
    cost numeric(18,6),
    cost_uom_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.cost_component OWNER TO ofbiz;

--
-- Name: cost_component pk_cost_component; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT pk_cost_component PRIMARY KEY (cost_component_id);


--
-- Name: cost_comp_calc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_calc ON cost_component USING btree (cost_component_calc_id);


--
-- Name: cost_comp_cuom; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_cuom ON cost_component USING btree (cost_uom_id);


--
-- Name: cost_comp_fxadsst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_fxadsst ON cost_component USING btree (fixed_asset_id);


--
-- Name: cost_comp_geo; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_geo ON cost_component USING btree (geo_id);


--
-- Name: cost_comp_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_party ON cost_component USING btree (party_id);


--
-- Name: cost_comp_prodfeat; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_prodfeat ON cost_component USING btree (product_feature_id);


--
-- Name: cost_comp_product; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_product ON cost_component USING btree (product_id);


--
-- Name: cost_comp_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_type ON cost_component USING btree (cost_component_type_id);


--
-- Name: cost_comp_weff; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cost_comp_weff ON cost_component USING btree (work_effort_id);


--
-- Name: cst_cmpnnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmpnnt_txcrts ON cost_component USING btree (created_tx_stamp);


--
-- Name: cst_cmpnnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cst_cmpnnt_txstmp ON cost_component USING btree (last_updated_tx_stamp);


--
-- Name: cost_component cost_comp_calc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_calc FOREIGN KEY (cost_component_calc_id) REFERENCES cost_component_calc(cost_component_calc_id);


--
-- Name: cost_component cost_comp_cuom; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_cuom FOREIGN KEY (cost_uom_id) REFERENCES uom(uom_id);


--
-- Name: cost_component cost_comp_fxadsst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_fxadsst FOREIGN KEY (fixed_asset_id) REFERENCES fixed_asset(fixed_asset_id);


--
-- Name: cost_component cost_comp_geo; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_geo FOREIGN KEY (geo_id) REFERENCES geo(geo_id);


--
-- Name: cost_component cost_comp_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: cost_component cost_comp_prodfeat; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_prodfeat FOREIGN KEY (product_feature_id) REFERENCES product_feature(product_feature_id);


--
-- Name: cost_component cost_comp_product; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_product FOREIGN KEY (product_id) REFERENCES product(product_id);


--
-- Name: cost_component cost_comp_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_type FOREIGN KEY (cost_component_type_id) REFERENCES cost_component_type(cost_component_type_id);


--
-- Name: cost_component cost_comp_weff; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY cost_component
    ADD CONSTRAINT cost_comp_weff FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

